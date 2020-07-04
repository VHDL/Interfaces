-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:         Patrick Lehmann
--
-- Package:         VHDL-2019 common interface descriptions
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

package Common is
	-- Differential signaling (DS or LVDS)
	type T_DS is record
		P : std_logic;
		N : std_logic;
	end record;

	alias T_LVDS        is T_DS;

	view V_DS_Out of T_DS is
		P : out;
		N : out;
	end view;
	alias V_DS_In is V_DS_Out'converse;

	alias V_LVDS_Out is V_DS_Out;
	alias V_LVDS_In  is V_DS_In;

	type T_DS_Vector is array(natural range <>) of T_DS;

	alias T_LVDS_Vector is T_DS_Vector;


	-- Transceiver lanes with differential signaling
	type T_DS_Lane is record
		TX : T_DS;
		RX : T_DS;
	end record;

	view V_DS_Lane of T_DS_Lane is
		TX : view V_DS_Out;
		RX : view V_DS_In;
	end view;

	type T_DS_Lane_Vector is array(natural range <>) of T_DS_Lane;

	alias T_LVDS_Lane_Vector is T_DS_Lane_Vector;


	-- Tristate (3-state) interface
	type T_Tristate is record
		I : std_logic;      -- Input
		O : std_logic;      -- Output
		T : std_logic;      -- Tristate / OutputEnable_n
	end record;

	view V_Tristate_Out of T_Tristate is
		I : in;
		O : out;
		T : out;
	end view;
	alias V_Tristate_In is V_Tristate_Out'converse;

	type T_Tristate_Vector is array(natural range <>) of T_Tristate;
end package;
