-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   Generic Avalon-MM interface for pre-constraining widths
--
-- Description:
--   Uses spec-matching names (address, writedata, readdata, byteenable, etc.)
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

use work.AvalonMM.all;

package AvalonMM_Generic is
	generic (
		constant ADDRESS_BITS    : positive;
		constant DATA_BITS       : positive;
		constant BURSTCOUNT_BITS : positive := 1
	);

	constant BYTEENABLE_BITS : positive := DATA_BITS / 8;

	-- Full Avalon-MM interface with all optional signals
	subtype AvalonMM_SizedInterface is AvalonMM_Interface(
		Address(ADDRESS_BITS - 1 downto 0),
		WriteData(DATA_BITS - 1 downto 0),
		ReadData(DATA_BITS - 1 downto 0),
		ByteEnable(BYTEENABLE_BITS - 1 downto 0),
		BurstCount(BURSTCOUNT_BITS - 1 downto 0)
	);

	subtype AvalonMM_SizedInterface_Vector is AvalonMM_Interface_Vector(open)(
		Address(ADDRESS_BITS - 1 downto 0),
		WriteData(DATA_BITS - 1 downto 0),
		ReadData(DATA_BITS - 1 downto 0),
		ByteEnable(BYTEENABLE_BITS - 1 downto 0),
		BurstCount(BURSTCOUNT_BITS - 1 downto 0)
	);

	-- Simplified Avalon-MM interface
	subtype AvalonMM_Simple_SizedInterface is AvalonMM_Simple_Interface(
		Address(ADDRESS_BITS - 1 downto 0),
		WriteData(DATA_BITS - 1 downto 0),
		ReadData(DATA_BITS - 1 downto 0),
		ByteEnable(BYTEENABLE_BITS - 1 downto 0)
	);

	subtype AvalonMM_Simple_SizedInterface_Vector is AvalonMM_Simple_Interface_Vector(open)(
		Address(ADDRESS_BITS - 1 downto 0),
		WriteData(DATA_BITS - 1 downto 0),
		ReadData(DATA_BITS - 1 downto 0),
		ByteEnable(BYTEENABLE_BITS - 1 downto 0)
	);

end package;
