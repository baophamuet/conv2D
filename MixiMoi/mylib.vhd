library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
package mylib is
--- bo dem
component counter_n is
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
end component counter_n;

--bo chon
component mux IS
    GENERIC(
	    DATA_WIDTH :  integer   -- Data Width
	    );
    PORT(
	w0,w1: IN std_logic_vector(DATA_WIDTH-1 downto 0);
	dout_sel : IN std_logic;
	f : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
	);
END component mux;
--bo nho dpmem
component dpmem is
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
	data_out : out std_logic_vector(DATA_WIDTH downto 0)
	
);
end component dpmem;

-- khoi xu li du lieu  datapath
component datapath is
generic(
	DATA_WIDTH: integer := 16;
	ADDR_WIDTH: integer :=16
);
port(
	clk,reset: in std_logic;
	we_a,we_k,we_c: in std_logic;-- tin hieu cho phep viet vao bo nho tung ma tran
	re_a,re_k,re_c: in std_logic;
	rowA,colA,rowK:in std_logic_vector (DATA_WIDTH/2-1 downto 0);
	addr_WA,addr_WK : in  std_logic_vector(ADDR_WIDTH -1 downto 0);
	data_inA: in std_logic_vector (DATA_WIDTH-1 downto 0);
	data_inK: in std_logic_vector (DATA_WIDTH-1 downto 0);
	data_outC: out std_logic_vector (2*DATA_WIDTH-1 downto 0);
	dout_sel:in std_logic;
	ld_m,ld_n,ld_i,ld_j: in std_logic;
	za,zk,zm,zn,zi,zj: out std_logic;
	en_m,en_n,en_i,en_j:in std_logic

);
end component datapath;

--khoi dieu khien controller
component controller is 
port(
	clk,reset:in std_logic;
	start :in std_logic;
	we_a,we_k,we_c: out std_logic;
	re_a,re_k,re_c: out std_logic;
	ld_m,ld_n,ld_i,ld_j: out std_logic;
	en_m,en_n,en_i,en_j: out std_logic;
	za,zk,zm,zn,zi,zj: in std_logic;
	dout_sel: out std_logic;
	done: out std_logic
);
end component controller;

--ConV2D 
component conv2D is
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
end component conv2D;
end package mylib;
