
Library ieee;
Use ieee.std_logic_1164.all;

Entity RegFile is
port( 
Port1_sel : in std_logic_vector(1 downto 0);
Port2_sel : in std_logic_vector(1 downto 0);

W_sel : in std_logic_vector(1 downto 0);
W_en : in std_logic;
Write_Vlaue : in std_logic_vector(15 downto 0);

Clk: in std_logic;
Rst : in std_logic;

Port1_data : out std_logic_vector(15 downto 0);
Port2_data : out std_logic_vector(15 downto 0)

);
end RegFile;

Architecture arch_RegFile of RegFile is

component my_nDFF is
port( Clk,Rst : in std_logic;
d : in std_logic_vector(15 downto 0);
q : out std_logic_vector(15 downto 0));
end component;

signal F1,F2,F3,F4: std_logic_vector(15 downto 0);
signal Write_Vlaue1,Write_Vlaue2,Write_Vlaue3,Write_Vlaue4: std_logic_vector(15 downto 0);
begin

fx1: my_nDFF port map(Clk,Rst,Write_Vlaue1,F1);
fx2: my_nDFF port map(Clk,Rst,Write_Vlaue2,F2);
fx3: my_nDFF port map(Clk,Rst,Write_Vlaue3,F3);
fx4: my_nDFF port map(Clk,Rst,Write_Vlaue4,F4);



Process (Clk,Rst)
begin
if Rst = '1' then
	Write_Vlaue1 <= (others=>'0'); Write_Vlaue2 <= (others=>'0') ; Write_Vlaue3 <= (others=>'0') ; Write_Vlaue4 <= (others=>'0') ;

elsif ( rising_edge(Clk) and W_en='1' ) then
	if W_sel="00" then Write_Vlaue1<=Write_Vlaue ;
	elsif W_sel="01" then Write_Vlaue2<=Write_Vlaue ;
	elsif W_sel="10" then Write_Vlaue3<=Write_Vlaue ;
	else Write_Vlaue4<=Write_Vlaue ;
	end if;
elsif ( rising_edge(Clk) and W_en='0' ) then
	if Port1_sel="00" then Port1_data<=F1 ;
	elsif Port1_sel="01" then Port1_data<=F2 ;
	elsif Port1_sel="10" then Port1_data<=F3 ;
	else  Port1_data<=F4 ;
	--else NULL;
	end if;

	if Port2_sel="00" then Port2_data<=F1 ;
	elsif Port2_sel="01" then Port2_data<=F2 ;
	elsif Port2_sel="10" then Port2_data<=F3 ;
	else  Port2_data<=F4 ;
	--else NULL;
	end if;

else NULL;
end if;

end process;

end arch_RegFile;
