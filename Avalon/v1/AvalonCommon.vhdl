-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   Common types for Avalon Memory-Mapped (MM) interfaces
--
-- Description:
--   Defines shared types for use in Avalon-MM records
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

package AvalonCommon is
	-- Common types
	subtype Data_Type        is std_ulogic_vector;
	subtype Address_Type     is unsigned;
	subtype ByteEnable_Type  is std_ulogic_vector;
	subtype BurstCount_Type  is unsigned;

	-- Avalon-MM Response
	subtype Response_Type is std_ulogic_vector(1 downto 0);
	constant AVALON_RESP_OKAY          : Response_Type := "00";
	constant AVALON_RESP_RESERVED      : Response_Type := "01";
	constant AVALON_RESP_SLAVEERROR    : Response_Type := "10";
	constant AVALON_RESP_DECODEERROR   : Response_Type := "11";

	type Avalon_System_Interface is record
		Clk    : std_ulogic;
		Reset  : std_ulogic;
	end record;

end package;
