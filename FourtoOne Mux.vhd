library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1 is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);     -- select input
           A,B,C,D   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
           X   : out STD_LOGIC_VECTOR (15 downto 0);-- output
end mux_4to1;

architecture Behavioral of mux_4to1 is
begin
with SEL select
    X <= A when "00",
         B when "01",
         C when "10",
         D when "11",
         "000000000000000"  when others;
end Behavioral;