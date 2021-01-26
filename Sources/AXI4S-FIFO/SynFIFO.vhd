library ieee;
use ieee.std_logic_1164.all;

-- Based on the awesome: http://www.sunburst-design.com/papers/CummingsSNUG2002SJ_FIFO1.pdf
-- with a twist to enable different read and write widths

entity SynFIFO is
    generic
    (
        READ_WIDTH      : integer       := 16;
        WRITE_WIDTH     : integer       := 16;
        DEPTH           : integer       := 256;
    );
    port
    (
        clk             : in        std_logic;
        reset           : in        std_logic;
        write_enable    : in        std_logic;
        read_enable     : in        std_logic;
        write_data      : in        std_logic_vector(WRITE_WIDTH-1 downto 0);
        read_data       : out       std_logic_vector(READ_WIDTH-1 downto 0);
        write_full      : out       std_logic;
        read_empty      : out       std_logic;
    );
end entity;

architecture arch of SynFIFO is
    constant MAX_WIDTH      : integer := MAX(READ_WIDTH, WRITE_WIDTH);
    constant MIN_WIDTH      : integer := MIN(READ_WIDTH, WRITE_WIDTH);
    constant MINS_PER_MAX   : integer := MAX_WIDTH/MIN_WIDTH;
    constant OFFSET         : integer := LOG2(MINS_PER_MAX);
    signal read_pointer     : std_logic_vector(LOG2(DEPTH)+OFFSET downto 0);
    signal write_pointer    : std_logic_vector(LOG2(DEPTH)+OFFSET downto 0);
    signal read_empty_internal  : std_logic;
    signal write_full_internal  : std_logic;

    type RAM_TYPE is (DEPTH-1 downto 0, MINS_PER_MAX-1 downto 0) of (MIN_WIDTH-1 downto 0);
    signal RAM is RAM_TYPE;
begin

    -- Equal
    EQUAL: if READ_WIDTH = WRITE_WIDTH generate
        process (clk, reset)
        begin
            if (reset = '1') then
                read_pointer <= (others => '0');
                write_pointer <= (others => '0');
                RAM <= (others => (others => (others => '0')));
            elsif (clk'event and clk = '1') then
                if (write_enable and not write_full_internal) then
                    RAM(to_integer(unsigned(write_pointer(LOG2(DEPTH)-1 downto 0))))(0) <= write_data;
                    write_pointer <= write_pointer + 1;
                end if;
                if (read_enable and not read_empty_internal) then
                    read_pointer <= read_pointer + 1;
                end if;
            end if;
        end process;
        read_data <= RAM(to_integer(unsigned(read_pointer(LOG2(DEPTH)-1 downto 0))))(0);
        read_empty_internal <= '1' when read_pointer = write_pointer else
                               '0';
        write_full_internal <= '1' when read_pointer(LOG2(DEPTH)-1 downto 0) = write_pointer(LOG2(DEPTH)-1 downto 0) and read_pointer(LOG2(DEPTH)) /= write_pointer(LOG2(DEPTH)) else
                               '0';
    end generate;

    -- Output Bigger
    BIGGER: if READ_WIDTH > WRITE_WIDTH generate
        process (clk, reset)
        begin
            if (reset = '1') then
                read_pointer <= (others => '0');
                write_pointer <= (others => '0');
                RAM <= (others => (others => (others => '0')));
            elsif (clk'event and clk = '1') then
                if (write_enable and not write_full_internal) then
                    RAM(to_integer(unsigned(write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))))(to_integer(unsigned(write_pointer(OFFSET-1 downto 0)))) <= write_data;
                    write_pointer <= write_pointer + 1;
                end if;
                if (read_enable and not read_empty_internal) then
                    read_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) <= read_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) + 1;
                end if;
            end if;
        end process;
        BIGGER_READ: for i in MINS_PER_MAX-1 downto 0 generate
            read_data((MIN_WIDTH*(i+1))-1 downto MIN_WIDTH*i) <= RAM(to_integer(unsigned(read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))))(i);
        end generate;
        read_empty_internal <= '1' when read_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) = write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) else
                               '0';
        write_full_internal <= '1' when read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET) = write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET) and read_pointer(LOG2(DEPTH)+OFFSET) /= write_pointer(LOG2(DEPTH)+OFFSET) else
                               '0';
    end generate;

    -- Output Smaller
    SMALLER: if READ_WIDTH < WRITE_WIDTH generate
        process (clk, reset)
        begin
            if (reset = '1') then
                read_pointer <= (others => '0');
                write_pointer <= (others => '0');
                RAM <= (others => (others => (others => '0')));
            elsif (clk'event and clk = '1') then
                if (write_enable and not write_full_internal) then
                    SMALLER_WRITE: for i in MINS_PER_MAX-1 downto 0 loop
                        RAM(to_integer(unsigned(write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))))(i) <= write_data((MIN_WIDTH*(i+1))-1 downto MIN_WIDTH*i);
                    end loop;
                    write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) <= write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) + 1;
                end if;
                if (read_enable and not read_empty_internal) then
                    read_pointer <= read_pointer + 1;
                end if;
            end if;
        end process;
        read_data <= RAM(to_integer(unsigned(read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET))))(to_integer(unsigned(read_pointer(OFFSET-1 downto 0))));
        read_empty_internal <= '1' when read_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) = write_pointer(LOG2(DEPTH)+OFFSET downto OFFSET) and (and read_pointer(OFFSET-1 downto 0) = '1')  else
                               '0';
        write_full_internal <= '1' when read_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET) = write_pointer(LOG2(DEPTH)+OFFSET-1 downto OFFSET) and read_pointer(LOG2(DEPTH)+OFFSET) /= write_pointer(LOG2(DEPTH)+OFFSET) else
                               '0';
    end generate;

    read_empty <= read_empty_internal;
    write_full <= write_full_internal;

end architecture;
