-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:         Patrick Lehmann
--
-- Package:         VHDL-2019 I²C interface descriptions
--
-- Description:
-- -------------------------------------
-- This package 
--
-- License:
-- =============================================================================
-- Copyright 2016-2020 Open Source VHDL Group
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
