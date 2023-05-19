-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 SPI interface descriptions
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

-- Signal name mappings
-- SCLK -> Serial Clock
-- MOSI -> Master Out/Slave In
-- MISO -> Master In/Slave Out
-- SS_n -> Slave Select; low-active
package SPI is
	type SPI_Interface is record
		SCLK : std_logic;
		MOSI : std_logic;
		MISO : std_logic;
		SS_n : std_logic_vector;
	end record;

	view SPI_MasterView of SPI_Interface is
		SCLK  : out;
		MOSI  : out;
		MISO  : in;
		SS_n  : out;
	end view;
	alias SPI_SlaveView is SPI_MasterView'converse;

	type SPI_Interface_Vector is array(natural range <>) of SPI_Interface;
end package;
