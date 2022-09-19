library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity controller is 
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
end controller;

architecture bev of controller is 
type State_type is (s0,s1,s21,s22,s2,s23,s24,s3,s41,s42,s4,s5,s6,s7,s8,s9,s10,s11,s14,s15,s16,s17);
signal state: State_type;
begin
--state process
FSM : process(clk,reset)
 begin
	if reset='1' then state<=s0;
	elsif (clk'event and clk='1') then 
	 case state is 
		when s0 => state <= s1;
		when s1 => 
			if start='1' then state <= s21;
			else state <= s1;
			end if;
		when s21 =>
			if za='1' then state <= s22;
			else state <= s21;
			end if;
		when s22 =>
			if zk='1' then state <= s2;
			else state <= s22;
			end if;
		when s2 => 
			if zm='0' then state <= s23;
			else state <= s15;
			end if;
		when s23 =>
			 state <= s24;		
		when s24 =>
			 state <= s3;
		when s3 => 
			if zn='0' then state <= s41;
			else state <= s14;
			end if;
		when s41 =>
			 state <= s42;		
		when s42 =>
			 state <= s4;
		when s4 => 
			if zi='0' then state <= s5;
			else state <= s11;
			end if;
		when s5 => 
			if zj='0' then state <= s6;
			else state <= s10;
			end if;
		when s6 => 
			 state <= s7;
		when s7 => 
			 state <= s8;
		when s8 => 
			 state <= s9;
		when s9 => 
			 state <= s5;
		when s10 => 
			 state <= s4;
		when s11 => 
			 state <= s3;
		when s14 => 
			 state <= s2;
		when s15 => 
			 state <= s16;
		when s16 => 
			if start='0' then state <= s0;
			else state <= s16;
			end if;
		when others => 
			 state <= s0;
	 end case;
		
	end if;
 end process;

--combinational logic 
we_a <='1' when state = s21 else  '0';
we_k <='1' when state = s22 else  '0';
re_a <='1' when state = s6 else  '0';
re_k <='1' when state = s6 else  '0';
re_c <='1' when (state = s8 or state = s24 or state = s42) else '0';
en_m <='1' when state = s14 else '0';
en_n <='1' when state = s11 else '0';
en_i <='1' when state = s10 else '0';
en_j <='1' when state = s9 else '0';
ld_m <='1' when (state = s0) else '0';
ld_n <='1' when (state = s0 or state = s14) else '0';
ld_i <='1' when (state = s0 or state = s11) else '0';
ld_j <='1' when (state = s0 or state = s10) else '0';
we_c <='1' when (state = s7 or state = s23 or state = s41) else '0';

dout_sel <='1' when state = s7  else '0';
done <='1' when ( state = s15) else '0';

end bev;