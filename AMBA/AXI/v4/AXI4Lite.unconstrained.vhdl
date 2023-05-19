-- =============================================================================
-- Authors:
--   Rob Gaddi
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 AXI4-Lite interface descriptions
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

use     work.Axi4Common.all;


package Axi4Lite is
	type Axi4Lite_Address_Interface is record
		-- Handshake signals
		Valid     : std_ulogic;
		Ready     : std_ulogic;

		-- Payload signals
		Address   : Address_Type;
		Cache     : Cache_Type;
		Protect   : Protect_Type;
	end record;

	type Axi4Lite_WriteData_Interface is record
		-- Handshake signals
		Valid     : std_ulogic;
		Ready     : std_ulogic;

		-- Payload signals
		Data      : Data_Type;
		Strobe    : Strobe_Type;
	end record;

	type Axi4Lite_WriteResponse_Interface is record
		-- Handshake signals
		Valid     : std_ulogic;
		Ready     : std_ulogic;

		-- Payload signals
		Response  : Response_Type;
	end record;

	type Axi4Lite_ReadData_Interface is record
		-- Handshake signals
		Valid   : std_ulogic;
		Ready   : std_ulogic;

		-- Payload signals
		Data      : Data_Type;
		Response  : Response_Type;
	end record;

	type Axi4Lite_Interface is record
		WriteAddress   : Axi4Lite_Address_Interface;
		WriteData      : Axi4Lite_WriteData_Interface;
		WriteResponse  : Axi4Lite_WriteResponse_Interface;
		ReadAddress    : Axi4Lite_Address_Interface;
		ReadData       : Axi4Lite_ReadData_Interface;
	end record;

	-- All lower-level views are defined from the driver's point of view.
	view Axi4Lite_Address_MasterView of Axi4Lite_Address_Interface is
		-- Handshake signals
		Valid     : out;
		Ready     : in;

		-- Payload signals
		Address   : out;
		Cache     : out;
		Protect   : out;
	end view;
	alias Axi4Lite_Address_SlaveView is Axi4Lite_Address_MasterView'converse;

	view Axi4Lite_WriteData_MasterView of Axi4Lite_WriteData_Interface is
		-- Handshake signals
		Valid     : out;
		Ready     : in;

		-- Payload signals
		Data      : out;
		Strobe    : out;
	end view;
	alias Axi4Lite_WriteData_SlaveView is Axi4Lite_WriteData_MasterView'converse;

	view Axi4Lite_WriteResponse_MasterView of Axi4Lite_WriteResponse_Interface is
		-- Handshake signals
		Valid     : in;
		Ready     : out;

		-- Payload signals
		Response  : in;
	end view;
	alias Axi4Lite_WriteResponse_SlaveView is Axi4Lite_WriteResponse_MasterView'converse;

	view Axi4Lite_ReadData_MasterView of Axi4Lite_ReadData_Interface is
		-- Handshake signals
		Valid     : in;
		Ready     : out;

		-- Payload signals
		Data      : in;
		Response  : in;
	end view;
	alias Axi4Lite_ReadData_SlaveView is Axi4Lite_ReadData_MasterView'converse;

	view Axi4Lite_MasterView of Axi4Lite_Interface is
		WriteAddress   : view Axi4Lite_Address_MasterView;
		WriteData      : view Axi4Lite_WriteData_MasterView;
		WriteResponse  : view Axi4Lite_WriteResponse_MasterView;
		ReadAddress    : view Axi4Lite_Address_MasterView;
		ReadData       : view Axi4Lite_ReadData_MasterView;
	end view;
	alias Axi4Lite_SlaveView is Axi4Lite_MasterView'converse;
end package;
