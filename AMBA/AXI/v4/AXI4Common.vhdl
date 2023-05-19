-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 Common types in AXI4 interface descriptions
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

library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;


package Axi4Common is
	-- Common to all AXI buses
	subtype Data_Type     is std_ulogic_vector;
	subtype User_Type     is std_ulogic_vector;

	-- Unique to AXI-Stream
	subtype Keep_Type     is std_ulogic_vector;

	-- Unique to AXI-Lite
	subtype Address_Type  is unresolved_unsigned;
	subtype Strobe_Type   is std_ulogic_vector;


	-- Unique to AXI
	subtype ID_Type               is unsigned;
	subtype Length_Type           is unsigned(3 downto 0);
	subtype Lock_Type             is std_ulogic_vector(3 downto 0);
	subtype Region_Type           is std_ulogic_vector(3 downto 0);
  subtype Cache_Type            is std_ulogic_vector(3 downto 0);
  subtype QualityOfService_Type is std_ulogic_vector(3 downto 0);


  subtype  Size_Type is unsigned(2 downto 0);
  constant AXI4_SIZE_1          : Size_Type := "000";
  constant AXI4_SIZE_2          : Size_Type := "001";
  constant AXI4_SIZE_4          : Size_Type := "010";
  constant AXI4_SIZE_8          : Size_Type := "011";
  constant AXI4_SIZE_16         : Size_Type := "100";
  constant AXI4_SIZE_32         : Size_Type := "101";
  constant AXI4_SIZE_64         : Size_Type := "110";
  constant AXI4_SIZE_128        : Size_Type := "111";


  subtype  Burst_Type is std_ulogic_vector(1 downto 0);
  constant AXI4_BURST_FIXED     : Burst_Type := "00";
  constant AXI4_BURST_INCR      : Burst_Type := "01";
  constant AXI4_BURST_WRAP      : Burst_Type := "10";


	subtype Response_Type is std_ulogic_vector(1 downto 0);
	constant AXI4_RESPONSE_OKAY         : Response_Type := "00";
	constant AXI4_RESPONSE_EX_OKAY      : Response_Type := "01";
	constant AXI4_RESPONSE_SLAVE_ERROR  : Response_Type := "10";
	constant AXI4_RESPONSE_DECODE_ERROR : Response_Type := "11";


	subtype Protect_Type is std_ulogic_vector(2 downto 0);
  -- Bit 0: 0 Unprivileged access   1 Privileged access
  -- Bit 1: 0 Secure access         1 Non-secure access
  -- Bit 2: 0 Data access           1 Instruction access
  constant AXI4_PROTECT_INIT          : Protect_Type := "UUU";
  constant AXI4_PROTECT_NONE          : Protect_Type := "000";


	type AXI4_System_Interface is record
		Clock    : std_ulogic;
		Reset_n  : std_ulogic;
	end record;

end package;
