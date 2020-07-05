-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:         Patrick Lehmann
--
-- Package:         VHDL-2019 Common types in AXI4 interface descriptions
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
use     IEEE.numeric_std.all;


package AXI4_Common is
	-- Common to all AXI buses
	subtype AXI_Data_Type     is std_ulogic_vector;
	
	-- Unique to AXI-Stream
	
	-- Unique to AXI-Lite
	subtype AXI_Address_Type  is unresolved_unsigned;
	subtype AXI_Strobe_Type   is std_ulogic_vector;
	subtype AXI_Keep_Type     is std_ulogic_vector;
	
	-- Unique to AXI
	subtype AXI_ID_Type       is unresolved_unsigned;
	subtype AXI_Region_Type   is unresolved_unsigned;
	
	-- Fixed sized types
	subtype AXI_Protect_Type  is std_ulogic_vector(2 downto 0);
	subtype AXI_Response_Type is std_ulogic_vector(1 downto 0);
	
	type AXI_System_Interface is record
		Clock    : std_ulogic;
		Reset_n  : std_ulogic;
	end record;
end package;
