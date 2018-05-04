library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity syncram is
Generic ( n : integer := 10);
port (
clk : in std_logic;
we : in std_logic;
PC : in std_logic_vector(15 downto 0);
--datain : in std_logic_vector(15 downto 0);
Instruction : out std_logic_vector(15 downto 0) );
end entity syncram;

architecture syncrama of syncram is
type ram_type is array (0 to ((2**n)-1)) of std_logic_vector(15 downto 0);
signal ram : ram_type;

begin 
--process(clk) is 
--begin 
--if rising_edge(clk) then
--if we = '1' then
--ram(to_integer(unsigned(PC))) <= datain;
--end if;
--end if;
--end process;
Instruction <= ram(to_integer(unsigned(PC)));
end architecture ;