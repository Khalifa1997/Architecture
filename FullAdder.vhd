Library ieee;
Use ieee.std_logic_1164.all;
Entity my_adder is
port( 
	a: in std_logic_vector(15 downto 0);
	s : out std_logic_vector(15 downto 0); 
end my_adder;

Architecture a_my_adder of my_adder is
begin
s <= a + 1;	
end a_my_adder;
