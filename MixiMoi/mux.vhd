LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY mux IS
    GENERIC(
	    DATA_WIDTH :  integer    -- Data Width
	    );
    PORT(
	w0,w1: IN std_logic_vector(DATA_WIDTH-1 downto 0);
	dout_sel : IN std_logic;
	f : OUT std_logic_vector(DATA_WIDTH-1 downto 0)
	);
END mux;
architecture Behaviral OF mux IS
BEGIN
process(w0,w1,dout_sel)
    begin
	if dout_sel = '0' then f <= w0;
        else f <= w1;
        end if;
    end process;
end behaviral;
