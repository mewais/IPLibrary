library ieee;
use ieee.std_logic_1164.all;

entity Synchronizer is
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
end entity;

architecture arch of Synchronizer is
    signal middle_signal        : std_logic_vector(WIDTH-1 downto 0);
begin
    process(domain2_clk, domain2_reset)
    begin
        if (domain2_reset = '1') then
            domain2_output <= (others => '0');
            middle_signal <= (others => '0');
        elsif (domain2_clk'event and domain2_clk = '1') then
            middle_signal <= domain1_input;
            domain2_output <= middle_signal;
        end if;
    end process;
end architecture;
