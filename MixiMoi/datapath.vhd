library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.mylib.all;

entity datapath is
generic(
	DATA_WIDTH: integer := 16;
	ADDR_WIDTH: integer :=16
);
port(
	clk,reset: in std_logic;
	we_a,we_k,we_c: in std_logic;-- tin hieu cho phep viet vao bo nho tung ma tran
	re_a,re_k,re_c: in std_logic;
	rowA,colA,rowK:in std_logic_vector (ADDR_WIDTH/2-1 downto 0);
	addr_WA,addr_WK : in  std_logic_vector(ADDR_WIDTH -1 downto 0);
	data_inA: in std_logic_vector (DATA_WIDTH-1 downto 0);
	data_inK: in std_logic_vector (DATA_WIDTH-1 downto 0);
	data_outC: out std_logic_vector (2*DATA_WIDTH-1 downto 0);
	dout_sel:in std_logic;
	ld_m,ld_n,ld_i,ld_j: in std_logic;
	za,zk,zm,zn,zi,zj: out std_logic;
	en_m,en_n,en_i,en_j:in std_logic

);
end datapath;

architecture rtl of datapath is
signal n,j,com_n,com_j:std_logic_vector (ADDR_WIDTH-1 downto 0);
signal m,i,com_m,com_i:std_logic_vector (ADDR_WIDTH/2-1 downto 0);
signal out_a,out_k:std_logic_vector (DATA_WIDTH-1 downto 0);
signal out_c:std_logic_vector (2*DATA_WIDTH-1 downto 0);
signal adder1,dtin: std_logic_vector(2*DATA_WIDTH-1 downto 0);
signal data_in0: std_logic_vector(2*DATA_WIDTH-1 downto 0):= "00000000000000000000000000000000";
signal	addr_A: std_logic_vector (DATA_WIDTH-1 downto 0);
signal	addr_K: std_logic_vector (DATA_WIDTH-1 downto 0);
signal	addr_C: std_logic_vector (DATA_WIDTH-1 downto 0);
begin 
--MUX


za <='0' when addr_WA<(rowA*colA)-"0000000000000001" else '1';
zk <='0' when addr_WK<(rowK*rowK)-"0000000000000001" else '1';

com_m <= rowA - rowK ;
com_n <= (colA - rowK)*"00000001";
com_i <= rowK -"00000001";
com_j <= (rowK - "00000001")*"00000001";

--adder1 
adder1<= out_c + out_a * out_k;

--adder2 
addr_C<=  m *(rowA-rowK+1) + n;

--adder3 
addr_A<= rowA * ( m+i) +n + j;


--adder6
addr_K <= i * rowK + j;


data_outC <= out_c;

--mux chon din
MUX123: mux
generic map(2*DATA_WIDTH)
PORT MAP(
		data_in0,
		adder1,
		dout_sel,
		dtin);
--matran a
mattrix_A: dpmem
generic map(DATA_WIDTH)
port map(clk,
	we_a,re_a ,addr_WA,
	data_inA,
	addr_A,
	out_a);
--matran kernel
mattrix_K: dpmem
generic map(DATA_WIDTH)
port map(clk,
	we_k,re_k ,addr_WK,
	data_inK,
	addr_K,
	out_k);

--matran ket qua
mattrix_C: dpmem
generic map(2*DATA_WIDTH)
port map(clk,
	we_c,re_c ,addr_C,
	dtin,
	addr_C,
	out_c);

-- bien dem m
counter_M: counter_n
generic map(DATA_WIDTH/2)
port map(clk, reset,
	en_m,
	ld_m,com_m,zm,
	m);

-- bien dem n
counter_nn: counter_n
generic map(DATA_WIDTH)
port map(clk, reset,
	en_n,
	ld_n,com_n,zn,
	n);

-- bien dem i
counter_I: counter_n
generic map(DATA_WIDTH/2)
port map(clk, reset,
	en_i,
	ld_i,com_i,zi,
	i);

-- bien dem j
counter_J: counter_n
generic map(DATA_WIDTH)
port map(clk, reset,
	en_j,
	ld_j,com_j,zj,
	j);

end;
