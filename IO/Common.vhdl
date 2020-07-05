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
	type Differatial_Interface is record
		P : std_logic;
		N : std_logic;
	end record;

	alias LVDS_Interface        is Differatial_Interface;

	view Differatial_OutView of Differatial_Interface is
		P : out;
		N : out;
	end view;
	alias Differatial_InView is Differatial_OutView'converse;

	alias LVDS_OutView is Differatial_OutView;
	alias LVDS_InView  is Differatial_InView;

	type Differatial_Interface_Vector is
		array(natural range <>)
		of Differatial_Interface;

	alias LVDS_Interface_Vector is Differatial_Interface;


	-- Transceiver lanes with differential signaling
	type DifferentialLane_Interface is record
		TX : Differatial_Interface;
		RX : Differatial_Interface;
	end record;

	view DifferentialLane_TransmitterView of DifferentialLane_Interface is
		TX : view Differatial_OutView;
		RX : view Differatial_InView;
	end view;

	type DifferentialLane_Interface_Vector is
		array(natural range <>)
		of DifferentialLane_Interface;

	alias LVDSLane_Interface_Vector is DifferentialLane_Interface_Vector;


	-- Tristate (3-state) interface
	type Tristate_Interface is record
		I : std_logic;      -- Input
		O : std_logic;      -- Output
		T : std_logic;      -- Tristate / OutputEnable_n
	end record;

	view Tristate_OutView of Tristate_Interface is
		I : in;
		O : out;
		T : out;
	end view;
	alias Tristate_InView is Tristate_OutView'converse;

	type Tristate_Interface_Vector is
		array(natural range <>)
		of Tristate_Interface;
end package;
