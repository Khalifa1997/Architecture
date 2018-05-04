Library ieee;
Use ieee.std_logic_1164.all;
Entity ControlUnit is
port( 
	a: in std_logic_vector(16 downto 0);
	 
end ControlUnit;

Architecture behaviour of ControlUnit is
begin
	
	
	s <= a xor 1;
	

end behaviour;
