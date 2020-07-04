-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:         Patrick Lehmann
--
-- Package:         VHDL-2019 SPI interface descriptions
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

library IEEE;
use     IEEE.std_logic_1164.all;

-- Signal name mappings
-- SCLK -> Serial Clock     
-- MOSI -> Master Out/Slave In
-- MISO -> Master In/Slave Out
-- SS_n -> Slave Select; low-active
package SPI is
	type T_SPI is record
		SCLK : std_logic;
		MOSI : std_logic;
		MISO : std_logic;
		SS_n : std_logic_vector;
	end record;

	view V_SPI_Out of T_SPI is
		SCLK  : out;
		MOSI  : out;
		MISO  : in;
		SS_n  : out;
	end view;
	alias V_SPI_In is V_SPI_Out'converse;

	type T_SPI_Vector is array(natural range <>) of T_SPI;
end package;
