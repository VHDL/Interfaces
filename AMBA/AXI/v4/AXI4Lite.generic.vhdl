-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   Generic AXI4-Lite interface descriptions for pre-constraining
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

use work.Axi4Lite.all;


package Axi4Lite_Generic is
	generic (
		constant ADDRESS_BITS : positive;
		constant DATA_BITS    : positive;
		constant STROBE_BITS  : positive := DATA_BITS / 8
	);

	subtype Axi4Lite_Address_SizedInterface is Axi4Lite_Address_Interface(
		Address(ADDRESS_BITS - 1 downto 0)
	);

	subtype Axi4Lite_WriteData_SizedInterface is Axi4Lite_WriteData_Interface(
		Data(DATA_BITS - 1 downto 0),
		Strobe(STROBE_BITS - 1 downto 0)
	);

	subtype Axi4Lite_ReadData_SizedInterface is Axi4Lite_ReadData_Interface(
		Data(DATA_BITS - 1 downto 0)
	);

	subtype Axi4Lite_SizedInterface is Axi4Lite_Interface(
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
