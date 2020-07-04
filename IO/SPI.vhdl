library IEEE;
use     IEEE.std_logic_1164.all;

-- Signal name mappings
-- TCK  -> Test Clock     
-- TRST -> Test Reset     
-- TMS  -> Test Mode Select
-- TDI  -> Test Data In    
-- TDO  -> Test Data Out   
package JTAG is
	type T_SPI is record
		SCLK : std_logic;
		MOSI : std_logic;
		MISO : std_logic;
		SS_n : std_logic_vector;
	end record;

	view V_SPI_Out of T_SPI is
		SCLK  : out;
		MOSI  : out;
		MISO  : in;
		SS_n  : out;
	end view;
	alias V_SPI_In is V_SPI_Out'converse;

	type T_SPI_Vector is array(natural range <>) of T_SPI;
end package;
