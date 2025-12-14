-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   Common types for Wishbone interfaces
--
-- Description:
--   Defines shared types like Address_Type, Data_Type for use in Wishbone 
--   records, following the Wishbone B.4 specification.
--
-- License:
-- =============================================================================
-- Copyright 2025-2025 Open Source VHDL Group
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
	subtype Data_Type        is std_ulogic_vector;
	subtype Address_Type     is unsigned;
	subtype Select_Type      is std_ulogic_vector;
	subtype Tag_Cycle_Type   is std_ulogic_vector;
	subtype Tag_Address_Type is std_ulogic_vector;
	subtype Tag_Data_Type    is std_ulogic_vector;

	-- Cycle Type Identifiers (CTI)
	subtype CycleType_Type is std_ulogic_vector(2 downto 0);
	constant WB_CTI_CLASSIC        : CycleType_Type := "000";  -- Classic cycle
	constant WB_CTI_CONST_BURST    : CycleType_Type := "001";  -- Constant address burst
	constant WB_CTI_INCR_BURST     : CycleType_Type := "010";  -- Incrementing burst
	constant WB_CTI_END_OF_BURST   : CycleType_Type := "111";  -- End of burst

	-- Burst Type Extension (BTE)
	subtype BurstType_Type is std_ulogic_vector(1 downto 0);
	constant WB_BTE_LINEAR         : BurstType_Type := "00";   -- Linear burst
	constant WB_BTE_WRAP_4         : BurstType_Type := "01";   -- 4-beat wrap burst
	constant WB_BTE_WRAP_8         : BurstType_Type := "10";   -- 8-beat wrap burst
	constant WB_BTE_WRAP_16        : BurstType_Type := "11";   -- 16-beat wrap burst

	type Wishbone_System_Interface is record
		Clock    : std_ulogic;
		Reset    : std_ulogic;
	end record;

end package;
