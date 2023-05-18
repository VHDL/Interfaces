-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:         Patrick Lehmann
--
-- Package:         VHDL-2019 MIPI C-PHY interface descriptions
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



package CPHY is
	type CPHYLane_Interface is record
		Low   : std_logic;
		Mid   : std_logic;
		High  : std_logic;
	end record;

	view CPHYLane_OutView of CPHYLane_Interface is
		Low   : out;
		Mid   : out;
		High  : out;
	end view;
	alias CPHYLane_InView is CPHYLane_OutView'converse;

	type CPHYLane_Interface_Vector is
		array(natural range <>)
		of CPHYLane_Interface;

end package;
