-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 JTAG interface descriptions
--
-- Description:
--   Undocumented
--
--   Interface name:    Joint Test Action Group (JTAG)
--   Developed by:      Joint Test Action Group (JTAG)
--   Standard/Manual:   IEEE Standard 1149.1-1990 - Standard Test Access Port and Boundary-Scan Architecture
--   Further links:     https://en.wikipedia.org/wiki/JTAG
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

-- Signal name mappings
-- TCK  -> Test Clock
-- TRST -> Test Reset
-- TMS  -> Test Mode Select
-- TDI  -> Test Data In
-- TDO  -> Test Data Out
package JTAG is
	type JTAG_Interface is record
		TCK  : std_logic;
		TRST : std_logic;
		TMS  : std_logic;
		TDI  : std_logic;
		TDO  : std_logic;
	end record;

	view JTAG_ChipView of JTAG_Interface is
		TCK  : in;
		TRST : in;
		TMS  : in;
		TDI  : in;
		TDO  : out;
	end view;
	alias JTAG_TesterView is JTAG_ChipView'converse;

end package;
