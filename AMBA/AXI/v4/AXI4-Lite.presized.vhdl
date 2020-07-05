-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:         Patrick Lehmann
--
-- Packages:        Package instances for AXI4-Lite with predefined sizes
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

package AXI4_A32_D8 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 8
	);

package AXI4_A32_D16 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 16
	);

package AXI4_A32_D32 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 32
	);

-- alias AXI4_32 is AXI4_A32_D32;
package AXI4_32 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 32
	);

package AXI4_A32_D64 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 64
	);

package AXI4_A32_D128 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 128
	);

package AXI4_A32_D256 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 32,
		DATA_BITS    => 256
	);




package AXI4_A64_D8 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 8
	);

package AXI4_A64_D16 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 16
	);

package AXI4_A64_D32 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 32
	);

package AXI4_A64_D64 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 64
	);

-- alias AXI4_64 is AXI4_A64_D64;
package AXI4_64 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 64
	);

package AXI4_A64_D128 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 128
	);

package AXI4_A64_D256 is new work.AXI4_Lite_generic
	generic map (
		ADDRESS_BITS => 64,
		DATA_BITS    => 256
	);
	