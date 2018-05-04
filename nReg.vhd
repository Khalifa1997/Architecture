Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
Entity my_nDFF is
port( Clk,Rst : in std_logic;
d,w : in std_logic_vector(15 downto 0);
q : out std_logic_vector(31 downto 0));
end my_nDFF;

Architecture a_my_nDFF of my_nDFF is
begin
Process (Clk,Rst)
begin
if Rst = '1' then
q <= (others=>'0');
elsif rising_edge(Clk) then
q <= d & w;
end if;
end process;
end a_my_nDFF;

