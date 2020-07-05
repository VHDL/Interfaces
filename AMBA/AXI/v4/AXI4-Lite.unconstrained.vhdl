-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:         Rob Gaddi
--                  Patrick Lehmann
--
-- Package:         VHDL-2019 AXI4-Lite interface descriptions
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
use     IEEE.numeric_std.all;

use     work.AXI4_Common.all;


package AXI4_Lite is
	-- AXI4-Lite address stream
	type AXI4Lite_Address_Interface is record
		-- Handshake signals
		Valid     : std_ulogic;
		Ready     : std_ulogic;
		
		-- Payload signals
		Address   : AXI_Address_Type;
		Protect   : AXI_Protect_Type;
	end record;

	type AXI4Lite_WriteData_Interface is record
		-- Handshake signals
		Valid     : std_ulogic;
		Ready     : std_ulogic;
		
		-- Payload signals
		Data      : AXI_Data_Type;
		Strobe    : AXI_Strobe_Type;
	end record;

	type AXI4Lite_WriteResponse_Interface is record
		-- Handshake signals
		Valid     : std_ulogic;
		Ready     : std_ulogic;
		
		-- Payload signals
		Response  : AXI_Response_Type;
	end record;

	type AXI4Lite_ReadData_Interface is record
		-- Handshake signals
		Valid   : std_ulogic;
		Ready   : std_ulogic;
		
		-- Payload signals
		Data      : AXI_Data_Type;
		Response  : AXI_Response_Type;
	end record;

	type AXI4Lite_Interface is record
		WriteAddress   : AXI4Lite_Address_Interface;
		WriteData      : AXI4Lite_WriteData_Interface;
		WriteResponse  : AXI4Lite_WriteResponse_Interface;
		ReadAddress    : AXI4Lite_Address_Interface;
		ReadData       : AXI4Lite_ReadData_Interface;
	end record;

end package;
