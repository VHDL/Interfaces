-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:         Patrick Lehmann
--
-- Package:         VHDL-2019 I²S interface descriptions
--
-- Description:
-- -------------------------------------
-- This package 
--
--   Designer: NXP (Philips)
--   Wikipedia: https://en.wikipedia.org/wiki/I%C2%B2S
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
-- SCK -> Serial Clock; alternatives: BCLK
-- WS  -> Word Select;  alternatives: LRCLK, FS
-- SD  -> Serial Data;  alternatives: SData, SDIn/SDOut, DACDat, ADCDat
package I2S is
	type I2S_Interface is record
		SCK : std_ulogic;
		WS  : std_ulogic;
		SD  : std_ulogic;
	end record;

	view I2S_SourceSync_SenderView of I2S_Interface is
		SCK : out;
		WS  : out;
		SD  : out;
	end view;
	alias I2S_SourceSync_ReceiverView  is I2S_SourceSync_SenderView'converse;

	view I2S_DestSync_SenderView of I2S_Interface is
		SCK : in;
		WS  : in;
		SD  : out;
	end view;
	alias I2S_DestSync_ReceiverView  is I2S_DestSync_SenderView'converse;

	type I2S_Interface_Vector is array(natural range <>) of I2S_Interface;

end package;
