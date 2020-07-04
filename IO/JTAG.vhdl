library IEEE;
use     IEEE.std_logic_1164.all;

-- Signal name mappings
-- TCK  -> Test Clock     
-- TRST -> Test Reset     
-- TMS  -> Test Mode Select
-- TDI  -> Test Data In    
-- TDO  -> Test Data Out   
package JTAG is
	type T_JTAG is record
		TCK  : std_logic;
		TRST : std_logic;
		TMS  : std_logic;
		TDI  : std_logic;
		TDO  : std_logic;
	end record;

	view V_JTAG_In of T_JTAG is
		TCK  : in;
		TRST : in;
		TMS  : in;
		TDI  : in;
		TDO  : out;
	end view;
	alias V_JTAG_Out is V_JTAG_In'converse;

end package;
