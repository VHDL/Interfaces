-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 I²C interface descriptions
--
-- Description:
--   Undocumented
--
--   Interface name:    I2C (Inter-Integrated Circuit)
--   Alternative names: Two-Wire-Interface (TWI)
--   Can be reused for: PMBus, SMBus
--   Developed by:      Philips / NXP Semiconductor
--   Standard/Manual:   http://www.nxp.com/documents/user_manual/UM10204.pdf
--   Further links:     https://en.wikipedia.org/wiki/I%C2%B2C
--
-- License:
-- =============================================================================
-- Copyright 2016-2025 Open Source VHDL Group
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- =============================================================================

library IEEE;
use     IEEE.std_logic_1164.all;

use     work.Common.all;

-- Signal name mappings
-- SCL -> Serial Clock
-- SDA -> Serial Data
package I2C is
	-- Chip external interface (PCB level)
	type I2C_PcbInterface is record
		SCL : std_logic;
		SDA : std_logic;
	end record;
	type I2C_PcbInterface_Vector is array(natural range <>) of I2C_PcbInterface;

	view I2C_PcbView of I2C_PcbInterface is
		SCL : inout;
		SDA : inout;
	end view;


	-- Chip internal interface, not supporting bidirectional signals (fabric level)
	type I2C_Interface is record
		SCL  : Tristate_Interface;
		SDA  : Tristate_Interface;
	end record;
	type I2C_Interface_Vector is array(natural range <>) of I2C_Interface;

	view I2C_ControllerView of I2C_Interface is
		SCL : view Tristate_OutView;
		SDA : view Tristate_OutView;
	end view;
	alias I2C_IOBView is I2C_ControllerView'converse;

end package;
