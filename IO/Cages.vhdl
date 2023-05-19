-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 interface descriptions for cages
--
-- Description:
--   Undocumented
--
-- License:
-- =============================================================================
-- Copyright 2016-2023 Open Source VHDL Group
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
use     work.I2C.all;


-- Signal name mappings
--
--
package Cages is
	-- SFP/SFP+
	type SFP_Interface is record
		ModuleAbsent    : std_logic;

		I2C             : I2C_PCB_Interface;

		TX_Disable      : std_logic;
		TX_Fault        : std_logic;
		RX_LossOfSignal : std_logic;

		TX              : Differatial_Interface;
		RX              : Differatial_Interface;
	end record;

	view SFP_ICView of SFP_Interface is
		ModuleAbsent    : in;

		I2C             : view I2C_PCB_View;

		TX_Disable      : out;
		TX_Fault        : in;
		RX_LossOfSignal : in;

		TX              : view Differatial_OutView;
		RX              : view Differatial_InView;
	end view;
	alias SFP_CageView is SFP_ICView'converse;

	type SFP_Interface_Vector is
		array(natural range <>)
		of SFP_Interface;


	-- QSFP/QSFP+/QSFP28/QSFP28+
	type QSFP_Interface is record
		ModuleSelect_n  : std_logic;
		ModulePresent_n : std_logic;
		LowPowerMode    : std_logic;

		Reset_n         : std_logic;
		I2C             : I2C_PCB_Interface;
		Interrupt_n     : std_logic;

		TX              : Differatial_Interface_Vector(3 downto 0);
		RX              : Differatial_Interface_Vector(3 downto 0);
	end record;

	view QSFP_ICView of QSFP_Interface is
		ModuleSelect_n  : out;
		ModulePresent_n : in;
		LowPowerMode    : out;

		Reset_n         : out;
		I2C             : view I2C_PCB_View;
		Interrupt_n     : in;

		TX              : view ( Differatial_OutView );
		RX              : view ( Differatial_InView );
	end view;
	alias QSFP_CageView is QSFP_ICView'converse;

	type QSFP_Interface_Vector is
		array(natural range <>)
		of QSFP_Interface;
end package;
