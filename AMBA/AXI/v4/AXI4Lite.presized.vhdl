-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   Package instances for AXI4-Lite with predefined sizes
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

package Axi4Lite_A32_D8 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 8
	);

package Axi4Lite_A32_D16 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 16
	);

package Axi4Lite_A32_D32 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 32
	);

-- alias Axi4_32 is Axi4Lite_A32_D32;
package Axi4Lite_32 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 32
	);

package Axi4Lite_A32_D64 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 64
	);

package Axi4Lite_A32_D128 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 128
	);

package Axi4Lite_A32_D256 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 256
	);




package Axi4Lite_A64_D8 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 8
	);

package Axi4Lite_A64_D16 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 16
	);

package Axi4Lite_A64_D32 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 32
	);

package Axi4Lite_A64_D64 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 64
	);

-- alias Axi4_64 is Axi4Lite_A64_D64;
package Axi4Lite_64 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 64
	);

package Axi4Lite_A64_D128 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 128
	);

package Axi4Lite_A64_D256 is new work.Axi4Lite_Generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 256
	);
