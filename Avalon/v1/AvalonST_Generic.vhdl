-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   Generic Avalon-ST interface descriptions for pre-constraining
--
-- Description:
--   Uses spec-matching names (data, valid, ready, channel, etc.)
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

use work.AvalonST.all;

package AvalonST_Generic is
	generic (
		constant DATA_BITS    : positive;
		constant EMPTY_BITS   : positive := 1;
		constant ERROR_BITS   : positive := 1;
		constant CHANNEL_BITS : positive := 1
	);

	-- Full Avalon-ST interface with all optional signals
	subtype AvalonST_SizedInterface is AvalonST_Interface(
		Data(DATA_BITS - 1 downto 0),
		Empty(EMPTY_BITS - 1 downto 0),
		Error(ERROR_BITS - 1 downto 0),
		Channel(CHANNEL_BITS - 1 downto 0)
	);

	subtype AvalonST_SizedInterface_Vector is AvalonST_Interface_Vector(open)(
		Data(DATA_BITS - 1 downto 0),
		Empty(EMPTY_BITS - 1 downto 0),
		Error(ERROR_BITS - 1 downto 0),
		Channel(CHANNEL_BITS - 1 downto 0)
	);

	-- Simplified Avalon-ST interface
	subtype AvalonST_Simple_SizedInterface is AvalonST_Simple_Interface(
		Data(DATA_BITS - 1 downto 0)
	);

	subtype AvalonST_Simple_SizedInterface_Vector is AvalonST_Simple_Interface_Vector(open)(
		Data(DATA_BITS - 1 downto 0)
	);

end package;
