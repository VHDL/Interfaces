-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   Common types for Wishbone interfaces
--
-- Description:
--   Defines shared types like Addr_Type, Data_Type for use in Wishbone 
--   records, following the Wishbone B.4 specification.
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

library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

package WishboneCommon is
	-- Common types
	subtype Data_Type is std_ulogic_vector;
	subtype Addr_Type is unsigned;
	subtype Sel_Type  is std_ulogic_vector;
	subtype Tgd_Type  is std_ulogic_vector;  -- Tag Data
	subtype Tga_Type  is std_ulogic_vector;  -- Tag Address
	subtype Tgc_Type  is std_ulogic_vector;  -- Tag Cycle

	-- Cycle Type Identifiers (CTI)
	subtype Cti_Type is std_ulogic_vector(2 downto 0);
	constant WB_CTI_CLASSIC        : Cti_Type := "000";  -- Classic cycle
	constant WB_CTI_CONST_BURST    : Cti_Type := "001";  -- Constant address burst
	constant WB_CTI_INCR_BURST     : Cti_Type := "010";  -- Incrementing burst
	constant WB_CTI_END_OF_BURST   : Cti_Type := "111";  -- End of burst

	-- Burst Type Extension (BTE)
	subtype Bte_Type is std_ulogic_vector(1 downto 0);
	constant WB_BTE_LINEAR         : Bte_Type := "00";   -- Linear burst
	constant WB_BTE_WRAP_4         : Bte_Type := "01";   -- 4-beat wrap burst
	constant WB_BTE_WRAP_8         : Bte_Type := "10";   -- 8-beat wrap burst
	constant WB_BTE_WRAP_16        : Bte_Type := "11";   -- 16-beat wrap burst

	type Wishbone_System_Interface is record
		Clk    : std_ulogic;  -- Clock
		Rst    : std_ulogic;  -- Reset
	end record;

end package;