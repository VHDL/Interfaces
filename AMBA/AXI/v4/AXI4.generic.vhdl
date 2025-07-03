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

use work.Axi4.all;


package Axi4_Generic is
	generic (
		constant ADDRESS_BITS : positive;
		constant DATA_BITS    : positive;
		constant STROBE_BITS  : positive := DATA_BITS / 8;
		constant ID_BITS      : positive;
		constant USER_BITS    : positive
	);

	subtype Axi4_Address_SizedInterface is Axi4_Address_Interface(
		ID(ID_BITS - 1 downto 0),
		Address(ADDRESS_BITS - 1 downto 0),
		User(USER_BITS - 1 downto 0)
	);

	subtype Axi4_WriteData_SizedInterface is Axi4_WriteData_Interface(
		Data(DATA_BITS - 1 downto 0),
		Strobe(STROBE_BITS - 1 downto 0),
		User(USER_BITS - 1 downto 0)
	);

	subtype Axi4_WriteResponse_SizedInterface is Axi4_WriteResponse_Interface(
		ID(ID_BITS - 1 downto 0),
		User(USER_BITS - 1 downto 0)
	);

	subtype Axi4_ReadData_SizedInterface is Axi4_ReadData_Interface(
		ID(ID_BITS - 1 downto 0),
		Data(DATA_BITS - 1 downto 0),
		User(USER_BITS - 1 downto 0)
	);

	subtype Axi4_SizedInterface is Axi4_Interface(
		WriteAddress(
			ID(ID_BITS - 1 downto 0),
			Address(ADDRESS_BITS - 1 downto 0),
			User(USER_BITS - 1 downto 0)
		),
		WriteData(
			Data(DATA_BITS - 1 downto 0),
			Strobe(STROBE_BITS - 1 downto 0),
			User(USER_BITS - 1 downto 0)
		),
		WriteResponse(
			ID(ID_BITS - 1 downto 0),
			User(USER_BITS - 1 downto 0)
		),
		ReadAddress(
			ID(ID_BITS - 1 downto 0),
			Address(ADDRESS_BITS - 1 downto 0),
			User(USER_BITS - 1 downto 0)
		),
		ReadData(
			ID(ID_BITS - 1 downto 0),
			Data(DATA_BITS - 1 downto 0),
			User(USER_BITS - 1 downto 0)
		)
	);
	
	subtype Axi4_SizedInterface_Vector is Axi4_Interface_Vector(open)(
		WriteAddress(
			ID(ID_BITS - 1 downto 0),
			Address(ADDRESS_BITS - 1 downto 0),
			User(USER_BITS - 1 downto 0)
		),
		WriteData(
			Data(DATA_BITS - 1 downto 0),
			Strobe(STROBE_BITS - 1 downto 0),
			User(USER_BITS - 1 downto 0)
		),
		WriteResponse(
			ID(ID_BITS - 1 downto 0),
			User(USER_BITS - 1 downto 0)
		),
		ReadAddress(
			ID(ID_BITS - 1 downto 0),
			Address(ADDRESS_BITS - 1 downto 0),
			User(USER_BITS - 1 downto 0)
		),
		ReadData(
			ID(ID_BITS - 1 downto 0),
			Data(DATA_BITS - 1 downto 0),
			User(USER_BITS - 1 downto 0)
		)
	);
end package;
