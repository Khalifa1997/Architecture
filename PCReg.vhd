Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
Entity pc_reg is
port( Clk,Rst : in std_logic;
d : in std_logic_vector(15 downto 0);
q : out std_logic_vector(15 downto 0));
end pc_reg;

Architecture a_pc_reg of pc_reg is
begin
Process (Clk,Rst)
begin
if Rst = '1' then
q <= (others=>'0');
elsif rising_edge(Clk) then
q <= d;
end if;
end process;
end a_pc_reg;

