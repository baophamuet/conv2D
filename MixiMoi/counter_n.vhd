library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter_n is
generic(
	ADDR_WIDTH : integer
);
port(
	clk, reset : in std_logic;
	en : in std_logic;
	ld: in std_logic;
	Com: in std_logic_vector(ADDR_WIDTH-1 downto 0);
	z: out std_logic;
	q: out std_logic_vector(ADDR_WIDTH-1 downto 0)
);
end counter_n;

architecture rtl of counter_n is 
signal coutn : std_logic_vector(ADDR_WIDTH-1 downto 0);
begin
process
begin
	if reset ='1' then coutn <= (others => '0');
	end if;
	wait until (clk'event and clk ='1');
	if ld='1' then 
	coutn <= (others => '0'); 
	z <= '0';
	 elsif en='1' then
		 if  coutn = Com then
           	  coutn <= coutn ;
            	  z <= '1';
        	 else
              	 coutn <= coutn + 1;
               	 z <= '0';
	end if;
	end if;
end process;
	q<= coutn;
end rtl;
