library IEEE;
use     IEEE.std_logic_1164.all;

use     work.Common.all;

-- Signal name mappings
-- SCL -> Serial Clock
-- SDA -> Serial Data
package I2C is
	-- Chip external interface (PCB level)
	type T_I2C_PCB is record
		SCL : std_logic;
		SDA : std_logic;
	end record;

	view V_I2C_PCB of T_I2C_PCB is
		SCL : inout;
		SDA : inout;
	end view;

	type T_I2C_PCB_Vector is array(natural range <>) of T_I2C_PCB;
	

	-- Chip internal interface, not supporting bidirectional signals (fabric level)
	type T_I2C is record
		SCL  : T_TriState;
		SDA  : T_TriState;
	end record;

	view V_I2C_Out of T_I2C is
		SCL : view V_Tristate_Out;
		SDA : view V_TriState_Out;
	end view;
	alias V_I2C_In is V_I2C_Out'converse;

	type T_I2C_Vector is array(natural range <>) of T_I2C;

end package;
