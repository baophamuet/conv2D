library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.mylib.all;
entity conv2D is
generic(
	DATA_WIDTH: integer := 16;
	ADDR_WIDTH: integer :=16
);
port(
	clk,reset: in std_logic;
	start:in std_logic;
	rowA,colA,rowK : in std_logic_vector(ADDR_WIDTH/2-1 downto 0);
	addr_WA,addr_WK : in  std_logic_vector(ADDR_WIDTH -1 downto 0);
	data_inA,data_inK: in std_logic_vector(DATA_WIDTH-1 downto 0);
	data_out: out std_logic_vector(2*DATA_WIDTH-1 downto 0);
	done :out std_logic
);
end conv2D;

architecture rtl of conv2D is
signal we_a,we_k,we_c: std_logic;
signal 	re_a,re_k,re_c: std_logic;
signal ld_m,ld_n,ld_i,ld_j: std_logic;
signal en_m,en_n,en_i,en_j: std_logic;
signal	za,zk,zm,zn,zi,zj: std_logic;
signal dout_sel: std_logic;
signal data_inC:std_logic_vector(2*DATA_WIDTH-1 downto 0);
signal data_outA,data_outK:std_logic_vector(DATA_WIDTH-1 downto 0);
begin
CTRL_UNIT: controller
port map(clk,reset,
	start ,
	we_a, we_k, we_c,
	re_a, re_k, re_c,
	ld_m, ld_n, ld_i, ld_j,
	en_m, en_n, en_i, en_j,
	za,zk,zm, zn, zi, zj,
	dout_sel,
 	done);

Datapath_Unit: datapath
generic map(
	DATA_WIDTH,
	ADDR_WIDTH
)
port map (
	clk,reset,
	we_a,we_k,we_c,
	re_a,re_k,re_c,
	rowA,colA,rowK,	
	addr_WA,addr_WK,
	data_inA,
	data_inK,
	data_out,
	dout_sel,
	ld_m,ld_n,ld_i,ld_j,
	za,zk,zm,zn,zi,zj,
	en_m,en_n,en_i,en_j

);
end rtl;

