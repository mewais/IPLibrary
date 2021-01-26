library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Calc.all;

-- Based on the awesome: http://www.sunburst-design.com/papers/CummingsSNUG2002SJ_FIFO1.pdf
-- with a twist to enable different read and write widths

entity WC_FIFO is
    generic
    (
        READ_WIDTH      : integer       := 16;
        WRITE_WIDTH     : integer       := 16;
        DEPTH           : integer       := 256;
        ASYNCHRONOUS    : boolean       := false
    );
    port
    (
        write_clk       : in        std_logic;
        write_reset     : in        std_logic;
        read_clk        : in        std_logic;
        read_reset      : in        std_logic;
        write_enable    : in        std_logic;
        read_enable     : in        std_logic;
        write_data      : in        std_logic_vector(WRITE_WIDTH-1 downto 0);
        read_data       : out       std_logic_vector(READ_WIDTH-1 downto 0);
        write_full      : out       std_logic;
        read_empty      : out       std_logic
    );
end entity;

architecture arch of WC_FIFO is

    component Synchronizer is
        generic
        (
            WIDTH       : integer       := 16
        );
        port
        (
            domain1_input           : in        std_logic_vector(WIDTH-1 downto 0);
            domain2_clk             : in        std_logic;
            domain2_reset           : in        std_logic;
            domain2_output          : out       std_logic_vector(WIDTH-1 downto 0)
        );
    end component;

    constant MAX_WIDTH      : integer := MAX(READ_WIDTH, WRITE_WIDTH);
    constant MIN_WIDTH      : integer := MIN(READ_WIDTH, WRITE_WIDTH);
    constant MINS_PER_MAX   : integer := MAX_WIDTH/MIN_WIDTH;
    constant OFFSET         : integer := LOG2(MINS_PER_MAX);
    signal read_pointer     : std_logic_vector(LOG2(DEPTH)+OFFSET downto 0);
    signal write_pointer    : std_logic_vector(LOG2(DEPTH)+OFFSET downto 0);
    signal read_gray        : std_logic_vector(LOG2(DEPTH)+OFFSET downto OFFSET);
    signal write_gray       : std_logic_vector(LOG2(DEPTH)+OFFSET downto OFFSET);
    signal sync_read_pointer     : std_logic_vector(LOG2(DEPTH)+OFFSET downto OFFSET);
    signal sync_write_pointer    : std_logic_vector(LOG2(DEPTH)+OFFSET downto OFFSET);
    signal read_empty_internal  : std_logic;
    signal write_full_internal  : std_logic;

    type RAM_TYPE is array (DEPTH-1 downto 0, MINS_PER_MAX-1 downto 0) of std_logic_vector(MIN_WIDTH-1 downto 0);
    signal RAM : RAM_TYPE;
    
    -- Stupid vivado does not support IPs with VHDL 2008 yet, use the following instead of reduction AND
    constant all_ones       : std_logic_vector(OFFSET-1 downto 0) := (others => '1');
begin

    ASYNC: if ASYNCHRONOUS = true generate
        -- Equal
        EQUAL: if READ_WIDTH = WRITE_WIDTH generate
            process (read_clk, read_reset)
            begin
                if (read_reset = '1') then
                    read_pointer <= (others => '0');
                elsif (read_clk'event and read_clk = '1') then
                    if (read_enable = '1' and read_empty_internal = '0') then
                        read_pointer <= std_logic_vector(unsigned(read_pointer) + 1);
                    end if;
                end if;
            end process;
            process (write_clk, write_reset)
            begin
                if (write_reset = '1') then
                    write_pointer <= (others => '0');
                    RAM <= (others => (others => (others => '0')));
                elsif (write_clk'event and write_clk = '1') then
                    if (write_enable = '1' and write_full_internal = '0') then
                        RAM(to_integer(unsigned(write_pointer(LOG2(DEPTH)-1 downto 0))), 0) <= write_data;
                        write_pointer <= std_logic_vector(unsigned(write_pointer) + 1);
                    end if;
                end if;
            end process;
            read_data <= RAM(to_integer(unsigned(read_pointer(LOG2(DEPTH)-1 downto 0))), 0);
            read_empty_internal <= '1' when read_gray = sync_write_pointer else
                                   '0';
            write_full_internal <= '1' when sync_read_pointer(LOG2(DEPTH)-2 downto 0) = write_gray(LOG2(DEPTH)-2 downto 0) and sync_read_pointer(LOG2(DEPTH)) /= write_gray(LOG2(DEPTH)) and sync_read_pointer(LOG2(DEPTH)-1) /= write_gray(LOG2(DEPTH)-1) else
                                   '0';
        end generate;

        -- Output Bigger
        BIGGER: if READ_WIDTH > WRITE_WIDTH generate
            process (read_clk, read_reset)
            begin
                if (read_reset = '1') then
                    read_pointer <= (others => '0');
                elsif (read_clk'event and read_clk = '1') then
                    if (read_enable = '1' and read_empty_internal = '0') then
                        read_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) <= std_logic_vector(unsigned(read_pointer(LOG2(DEPTH)+OFFSET downto OFFSET)) + 1);
                    end if;
                end if;
            end process;
            process (write_clk, write_reset)
            begin
                if (write_reset = '1') then
                    write_pointer <= (others => '0');
                    RAM <= (others => (others => (others => '0')));
                elsif (write_clk'event and write_clk = '1') then
                    if (write_enable = '1' and write_full_internal = '0') then
                        RAM(to_integer(unsigned(write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))), to_integer(unsigned(write_pointer(OFFSET-1 downto 0)))) <= write_data;
                        write_pointer <= std_logic_vector(unsigned(write_pointer) + 1);
                    end if;
                end if;
            end process;
            BIGGER_READ: for i in MINS_PER_MAX-1 downto 0 generate
                read_data((MIN_WIDTH*(i+1))-1 downto MIN_WIDTH*i) <= RAM(to_integer(unsigned(read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))), i);
            end generate;
            read_empty_internal <= '1' when read_gray(LOG2(DEPTH)+OFFSET downto OFFSET) = sync_write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) else
                                   '0';
            write_full_internal <= '1' when sync_read_pointer(LOG2(DEPTH)+OFFSET-2 downto OFFSET) = write_gray(LOG2(DEPTH)+OFFSET-2 downto OFFSET) and sync_read_pointer(LOG2(DEPTH)+OFFSET) /= write_gray(LOG2(DEPTH)+OFFSET) and sync_read_pointer(LOG2(DEPTH)+OFFSET-1) /= write_gray(LOG2(DEPTH)+OFFSET-1) else
                                   '0';
        end generate;

        -- Output Smaller
        SMALLER: if READ_WIDTH < WRITE_WIDTH generate
            process (read_clk, read_reset)
            begin
                if (read_reset = '1') then
                    read_pointer <= (others => '0');
                elsif (read_clk'event and read_clk = '1') then
                    if (read_enable = '1' and read_empty_internal = '0') then
                        read_pointer <= std_logic_vector(unsigned(read_pointer) + 1);
                    end if;
                end if;
            end process;
            process (write_clk, write_reset)
            begin
                if (write_reset = '1') then
                    write_pointer <= (others => '0');
                    RAM <= (others => (others => (others => '0')));
                elsif (write_clk'event and write_clk = '1') then
                    if (write_enable = '1' and write_full_internal = '0') then
                        SMALLER_WRITE: for i in MINS_PER_MAX-1 downto 0 loop
                            RAM(to_integer(unsigned(write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))), i) <= write_data((MIN_WIDTH*(i+1))-1 downto MIN_WIDTH*i);
                        end loop;
                        write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) <= std_logic_vector(unsigned(write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET)) + 1);
                    end if;
                end if;
            end process;
            read_data <= RAM(to_integer(unsigned(read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))), to_integer(unsigned(read_pointer(OFFSET-1 downto 0))));
            read_empty_internal <= '1' when (read_gray(LOG2(DEPTH)+OFFSET downto OFFSET) = sync_write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET)) and (read_pointer(OFFSET-1 downto 0) = all_ones) else
                                   '0';
            write_full_internal <= '1' when sync_read_pointer(LOG2(DEPTH)+OFFSET-2 downto OFFSET) = write_gray(LOG2(DEPTH)+OFFSET-2 downto OFFSET) and sync_read_pointer(LOG2(DEPTH)+OFFSET) /= write_gray(LOG2(DEPTH)+OFFSET) and sync_read_pointer(LOG2(DEPTH)+OFFSET-1) /= write_gray(LOG2(DEPTH)+OFFSET-1)else
                                   '0';
        end generate;

        -- Synchronous stuff
        read_gray <= ('0' & read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET+1)) xor read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET);
        write_gray <= ('0' & write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET+1)) xor write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET);
        CDC1: Synchronizer
            generic map(LOG2(DEPTH)+OFFSET+1)
            port map(write_gray, read_clk, read_reset, sync_write_pointer);
        CDC2: Synchronizer
            generic map(LOG2(DEPTH)+OFFSET+1)
            port map(read_gray, write_clk, write_reset, sync_read_pointer);

        read_empty <= read_empty_internal;
        write_full <= write_full_internal;
    end generate;
    
    SYNC: if ASYNCHRONOUS = false generate
        -- Equal
        EQUAL: if READ_WIDTH = WRITE_WIDTH generate
            process (write_clk, write_reset)
            begin
                if (write_reset = '1') then
                    read_pointer <= (others => '0');
                    write_pointer <= (others => '0');
                    RAM <= (others => (others => (others => '0')));
                elsif (write_clk'event and write_clk = '1') then
                    if (write_enable = '1' and write_full_internal = '0') then
                        RAM(to_integer(unsigned(write_pointer(LOG2(DEPTH)-1 downto 0))), 0) <= write_data;
                        write_pointer <= std_logic_vector(unsigned(write_pointer) + 1);
                    end if;
                    if (read_enable = '1' and read_empty_internal = '0') then
                        read_pointer <= std_logic_vector(unsigned(read_pointer) + 1);
                    end if;
                end if;
            end process;
            read_data <= RAM(to_integer(unsigned(read_pointer(LOG2(DEPTH)-1 downto 0))), 0);
            read_empty_internal <= '1' when read_pointer = write_pointer else
                                   '0';
            write_full_internal <= '1' when read_pointer(LOG2(DEPTH)-1 downto 0) = write_pointer(LOG2(DEPTH)-1 downto 0) and read_pointer(LOG2(DEPTH)) /= write_pointer(LOG2(DEPTH)) else
                                   '0';
        end generate;

        -- Output Bigger
        BIGGER: if READ_WIDTH > WRITE_WIDTH generate
            process (write_clk, write_reset)
            begin
                if (write_reset = '1') then
                    read_pointer <= (others => '0');
                    write_pointer <= (others => '0');
                    RAM <= (others => (others => (others => '0')));
                elsif (write_clk'event and write_clk = '1') then
                    if (write_enable = '1' and write_full_internal = '0') then
                        RAM(to_integer(unsigned(write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))), to_integer(unsigned(write_pointer(OFFSET-1 downto 0)))) <= write_data;
                        write_pointer <= std_logic_vector(unsigned(write_pointer) + 1);
                    end if;
                    if (read_enable = '1' and read_empty_internal = '0') then
                        read_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) <= std_logic_vector(unsigned(read_pointer(LOG2(DEPTH)+OFFSET downto OFFSET)) + 1);
                    end if;
                end if;
            end process;
            BIGGER_READ: for i in MINS_PER_MAX-1 downto 0 generate
                read_data((MIN_WIDTH*(i+1))-1 downto MIN_WIDTH*i) <= RAM(to_integer(unsigned(read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))), i);
            end generate;
            read_empty_internal <= '1' when read_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) = write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) else
                                   '0';
            write_full_internal <= '1' when read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET) = write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET) and read_pointer(LOG2(DEPTH)+OFFSET) /= write_pointer(LOG2(DEPTH)+OFFSET) else
                                   '0';
        end generate;

        -- Output Smaller
        SMALLER: if READ_WIDTH < WRITE_WIDTH generate
            process (write_clk, write_reset)
            begin
                if (write_reset = '1') then
                    read_pointer <= (others => '0');
                    write_pointer <= (others => '0');
                    RAM <= (others => (others => (others => '0')));
                elsif (write_clk'event and write_clk = '1') then
                    if (write_enable = '1' and write_full_internal = '0') then
                        SMALLER_WRITE: for i in MINS_PER_MAX-1 downto 0 loop
                            RAM(to_integer(unsigned(write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))), i) <= write_data((MIN_WIDTH*(i+1))-1 downto MIN_WIDTH*i);
                        end loop;
                        write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) <= std_logic_vector(unsigned(write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET)) + 1);
                    end if;
                    if (read_enable = '1' and read_empty_internal = '0') then
                        read_pointer <= std_logic_vector(unsigned(read_pointer) + 1);
                    end if;
                end if;
            end process;
            read_data <= RAM(to_integer(unsigned(read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))), to_integer(unsigned(read_pointer(OFFSET-1 downto 0))));
            read_empty_internal <= '1' when read_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) = write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) and (read_pointer(OFFSET-1 downto 0) = all_ones)  else
                                   '0';
            write_full_internal <= '1' when read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET) = write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET) and read_pointer(LOG2(DEPTH)+OFFSET) /= write_pointer(LOG2(DEPTH)+OFFSET) else
                                   '0';
        end generate;

        read_empty <= read_empty_internal;
        write_full <= write_full_internal;
    end generate;

end architecture;
