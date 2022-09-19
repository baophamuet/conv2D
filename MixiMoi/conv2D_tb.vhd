library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.mylib.all;

entity conv2D_tb is
generic(
	DATA_WIDTH: integer := 16;
	ADDR_WIDTH: integer :=16
);
end conv2D_tb;

architecture rtl of conv2D_tb is
signal clk: std_logic :='0';
signal reset: std_logic;
signal	start:  std_logic;
signal	rowA,colA,rowK :   std_logic_vector(ADDR_WIDTH/2-1 downto 0);
signal addr_WA : std_logic_vector(ADDR_WIDTH -1 downto 0):= "0000000000000000";
signal addr_WK : std_logic_vector(ADDR_WIDTH -1 downto 0):= "0000000000000000";
signal	data_inA: std_logic_vector(DATA_WIDTH-1 downto 0):= "0000000000000001";
signal	data_inK: std_logic_vector(DATA_WIDTH-1 downto 0):= "0000000000000001";
signal	data_out:  std_logic_vector(2*DATA_WIDTH-1 downto 0);
signal	done : std_logic;
signal i:std_logic_vector(DATA_WIDTH-1 downto 0);
begin
UUT: conv2D
generic map(
	DATA_WIDTH,
	ADDR_WIDTH
)
port map(
	clk,reset,
	start,
	rowA,colA,rowK ,
	addr_WA,addr_WK,
	data_inA,data_inK,
	data_out,
	done
);
clk<= not clk after 10ns;
--stimulus
Stimulus: process
begin	
	reset <='0';
	start<='1';
	rowA<="00000101";
	colA<="00000101";
	rowK<="00000011";
	wait for 60ns;	
     	--for i in 0 to (conv_integer(rowA*colA)-2) loop
--0
	
--1
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--2
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--3
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--4
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--5
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--6
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--7
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--8
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--9
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--10
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--11
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--12
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--13
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--14
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--15
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--16
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--17
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--18
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--19
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--20
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--21
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--22
	data_inA<="0000000000000001";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--23
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;
--24
	data_inA<="0000000000000000";
	addr_WA <=addr_WA +"0000000000000001";
	wait for 20ns;

--	end loop;
	

	wait for 20ns;
--	for i in 0 to(conv_integer(rowK*rowK) -2) loop
--0	
	
--1	
	data_inK<="0000000000000000";
	addr_WK <=addr_WK +"0000000000000001";
	wait for 20ns;
--2	
	data_inK<="0000000000000001";
	addr_WK <=addr_WK +"0000000000000001";
	wait for 20ns;
--3	
	data_inK<="0000000000000000";
	addr_WK <=addr_WK +"0000000000000001";
	wait for 20ns;
--4	
	data_inK<="0000000000000001";
	addr_WK <=addr_WK +"0000000000000001";
	wait for 20ns;
--5	
	data_inK<="0000000000000000";
	addr_WK <=addr_WK +"0000000000000001";
	wait for 20ns;
--6
	data_inK<="0000000000000001";
	addr_WK <=addr_WK +"0000000000000001";
	wait for 20ns;
--7	
	data_inK<="0000000000000000";
	addr_WK <=addr_WK +"0000000000000001";
	wait for 20ns;
--8	
	data_inK<="0000000000000001";
	addr_WK <=addr_WK +"0000000000000001";
	wait for 20ns;
--	end loop;
	wait until start='0';

end process;
end;
