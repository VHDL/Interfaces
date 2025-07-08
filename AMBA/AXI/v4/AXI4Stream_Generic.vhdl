-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   Generic Axi4-Stream interface descriptions for pre-constraining
--
-- Description:
--   Undocumented
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

use work.Axi4Lite.all;


package Axi4Stream_Generic is
	generic (
		constant DATA_BITS    : positive;
		constant USER_BITS    : positive
	);

	constant KEEP_BITS  : positive := DATA_BITS / 8;

	subtype Axi4Stream_SizedInterface is Axi4Stream_Interface(
		Data(DATA_BITS - 1 downto 0),
		Keep(KEEP_BITS - 1 downto 0),
		User(USER_BITS -  1 downto 0)
	);

end package;
