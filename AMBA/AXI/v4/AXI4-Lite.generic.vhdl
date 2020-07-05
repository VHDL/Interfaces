-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:         Patrick Lehmann
--
-- Generic Package: Generic AXI4-Lite interface descriptions for pre-constraining
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

use work.AXI4_Lite.all;


package AXI4_Lite_generic is
	generic (
		constant ADDRESS_BITS : positive;
		constant DATA_BITS    : positive;
		constant STROBE_BITS  : positive := DATA_BITS / 8
	);
	
	subtype AXI4Lite_Address_SizedInterface is AXI4Lite_Address_Interface(
		Address(ADDRESS_BITS - 1 downto 0)
	);
	
	subtype AXI4Lite_WriteData_SizedInterface is AXI4Lite_WriteData_Interface(
		Data(DATA_BITS - 1 downto 0),
		Strobe(STROBE_BITS - 1 downto 0)
	);

	subtype AXI4Lite_ReadData_SizedInterface is AXI4Lite_ReadData_Interface(
		Data(DATA_BITS - 1 downto 0)
	);

	subtype AXI4Lite_SizedInterface is AXI4Lite_Interface(
		WriteAddress(
			Address(ADDRESS_BITS - 1 downto 0)
		),
		WriteData(
			Data(DATA_BITS - 1 downto 0),
			Strobe(STROBE_BITS - 1 downto 0)
		),
		ReadAddress(
			Address(ADDRESS_BITS - 1 downto 0)
		),
		ReadData(
			Data(DATA_BITS - 1 downto 0)
		)
	);
end package;
