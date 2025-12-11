-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   Generic Wishbone interface for pre-constraining widths
--
-- Description:
--   Uses spec-matching names (Addr, Sel, Dat, Cyc, Stb, etc.)
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

use work.Wishbone.all;

package Wishbone_Generic is
	generic (
		constant ADDRESS_BITS : positive;
		constant DATA_BITS    : positive;
		constant TGD_BITS     : positive := 1;
		constant TGA_BITS     : positive := 1;
		constant TGC_BITS     : positive := 1
	);

	constant SEL_BITS : positive := DATA_BITS / 8;

	-- Full Wishbone interface with all optional signals
	subtype Wishbone_SizedInterface is Wishbone_Interface(
		Addr(ADDRESS_BITS - 1 downto 0),
		Dat_m(DATA_BITS - 1 downto 0),
		Dat_s(DATA_BITS - 1 downto 0),
		Sel(SEL_BITS - 1 downto 0),
		Tgd_m(TGD_BITS - 1 downto 0),
		Tgd_s(TGD_BITS - 1 downto 0),
		Tga(TGA_BITS - 1 downto 0),
		Tgc(TGC_BITS - 1 downto 0)
	);

	subtype Wishbone_SizedInterface_Vector is Wishbone_Interface_Vector(open)(
		Addr(ADDRESS_BITS - 1 downto 0),
		Dat_m(DATA_BITS - 1 downto 0),
		Dat_s(DATA_BITS - 1 downto 0),
		Sel(SEL_BITS - 1 downto 0),
		Tgd_m(TGD_BITS - 1 downto 0),
		Tgd_s(TGD_BITS - 1 downto 0),
		Tga(TGA_BITS - 1 downto 0),
		Tgc(TGC_BITS - 1 downto 0)
	);

	-- Simplified Wishbone interface
	subtype Wishbone_Simple_SizedInterface is Wishbone_Simple_Interface(
		Addr(ADDRESS_BITS - 1 downto 0),
		Dat_m(DATA_BITS - 1 downto 0),
		Dat_s(DATA_BITS - 1 downto 0),
		Sel(SEL_BITS - 1 downto 0)
	);

	subtype Wishbone_Simple_SizedInterface_Vector is Wishbone_Simple_Interface_Vector(open)(
		Addr(ADDRESS_BITS - 1 downto 0),
		Dat_m(DATA_BITS - 1 downto 0),
		Dat_s(DATA_BITS - 1 downto 0),
		Sel(SEL_BITS - 1 downto 0)
	);

end package;