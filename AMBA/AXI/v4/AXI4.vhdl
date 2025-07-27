-- =============================================================================
-- Authors:
--   Rob Gaddi
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 Axi4 interface descriptions
--
-- Description:
--   Undocumented
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

use     work.Axi4Common.all;


package Axi4 is
	type Axi4_Address_Interface is record
		-- Handshake signals
		Valid     : std_ulogic;
		Ready     : std_ulogic;

		-- Payload signals
		ID        : ID_Type;
		Address   : Address_Type;
		Length    : Length_Type;
		Size      : Size_Type;
		Burst     : Burst_Type;
		Lock      : Lock_Type;
		QoS       : QoS_Type;
		Region    : Region_Type;
		Cache     : Cache_Type;
		Protect   : Protect_Type;

		User      : User_Type;
	end record;
	type Axi4_Address_Interface_Vector is array(natural range <>) of Axi4_Address_Interface;


	type Axi4_WriteData_Interface is record
		-- Handshake signals
		Valid     : std_ulogic;
		Ready     : std_ulogic;

		-- Payload signals
		Data      : Data_Type;
		Strobe    : Strobe_Type;
		Last      : std_ulogic;

		User      : User_Type;
	end record;
	type Axi4_WriteData_Interface_Vector is array(natural range <>) of Axi4_WriteData_Interface;

	type Axi4_WriteResponse_Interface is record
		-- Handshake signals
		Valid     : std_ulogic;
		Ready     : std_ulogic;

		-- Payload signals
		ID        : ID_Type;
		Response  : Response_Type;

		User      : User_Type;
	end record;
	type Axi4_WriteResponse_Interface_Vector is array(natural range <>) of Axi4_WriteResponse_Interface;

	type Axi4_ReadData_Interface is record
		-- Handshake signals
		Valid     : std_ulogic;
		Ready     : std_ulogic;

		-- Payload signals
		ID        : ID_Type;
		Response  : Response_Type;

		Data      : Data_Type;
		Last      : std_ulogic;

		User      : User_Type;
	end record;
	type Axi4_ReadData_Interface_Vector is array(natural range <>) of Axi4_ReadData_Interface;

	type Axi4_Interface is record
		WriteAddress   : Axi4_Address_Interface;
		WriteData      : Axi4_WriteData_Interface;
		WriteResponse  : Axi4_WriteResponse_Interface;
		ReadAddress    : Axi4_Address_Interface;
		ReadData       : Axi4_ReadData_Interface;
	end record;
	type Axi4_Interface_Vector is array(natural range <>) of Axi4_Interface;

	-- All lower-level views are defined from the driver's point of view.
	view Axi4_Address_ManagerView of Axi4_Address_Interface is
		-- Handshake signals
		Valid     : out;
		Ready     : in;

		-- Payload signals
		ID        : out;
		Address   : out;
		Length    : out;
		Size      : out;
		Burst     : out;
		Lock      : out;
		QoS       : out;
		Region    : out;
		Cache     : out;
		Protect   : out;
		User      : out;
	end view;
	alias Axi4_Address_SubordinateView is Axi4_Address_ManagerView'converse;

	view Axi4_WriteData_ManagerView of Axi4_WriteData_Interface is
		-- Handshake signals
		Valid     : out;
		Ready     : in;

		-- Payload signals
		Data      : out;
		Strobe    : out;
		Last      : out;
		User      : out;
	end view;
	alias Axi4_WriteData_SubordinateView is Axi4_WriteData_ManagerView'converse;

	view Axi4_WriteResponse_ManagerView of Axi4_WriteResponse_Interface is
		-- Handshake signals
		Valid     : in;
		Ready     : out;

		-- Payload signals
		ID        : in;
		Response  : in;
		User      : in;
	end view;
	alias Axi4_WriteResponse_SubordinateView is Axi4_WriteResponse_ManagerView'converse;

	view Axi4_ReadData_ManagerView of Axi4_ReadData_Interface is
		-- Handshake signals
		Valid     : in;
		Ready     : out;

		-- Payload signals
		ID        : in;
		Response  : in;
		Data      : in;
		Last      : in;
		User      : in;
	end view;
	alias Axi4_ReadData_SubordinateView is Axi4_ReadData_ManagerView'converse;

	view Axi4_ManagerView of Axi4_Interface is
		WriteAddress   : view Axi4_Address_ManagerView;
		WriteData      : view Axi4_WriteData_ManagerView;
		WriteResponse  : view Axi4_WriteResponse_ManagerView;
		ReadAddress    : view Axi4_Address_ManagerView;
		ReadData       : view Axi4_ReadData_ManagerView;
	end view;
	alias Axi4_SubordinateView is Axi4_ManagerView'converse;

end package;
