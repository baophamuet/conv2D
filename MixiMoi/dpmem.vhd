library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity dpmem is
generic(
	DATA_WIDTH: integer := 16;
	ADDR_WIDTH: integer :=16
);
port(
	clk: in std_logic;
	we,re : in std_logic;
	addr_W : in  std_logic_vector(ADDR_WIDTH -1 downto 0);
	data_in: in std_logic_vector (DATA_WIDTH-1 downto 0);
	addr : in std_logic_vector (ADDR_WIDTH-1 downto 0);
	data_out : out std_logic_vector(DATA_WIDTH-1 downto 0)
	
);
end dpmem;

architecture rtl of dpmem is

type DATA_ARRAY is array (integer range <>) of std_logic_vector(DATA_WIDTH -1 downto 0); -- Memory Type
signal M:     DATA_ARRAY(0 to (2**ADDR_WIDTH) -1) := (others => (others => '0'));  	 -- Memory model
signal en: std_logic;
signal d_o: std_logic_vector(DATA_WIDTH -1 downto 0):= (others => '0'); 
begin

 process (clk)
 begin
	if (clk'event and clk ='1') then 
	   if we='1' then 
		M(conv_integer(addr_W))<=data_in;
	   else if re='1' then d_o<= M(conv_integer(addr));
				data_out <= d_o;
		else data_out<= d_o;
		end if; 
	   end if;
	end if;
 end process;

end rtl;


