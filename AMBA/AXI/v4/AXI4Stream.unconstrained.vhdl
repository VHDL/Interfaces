-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 AXI4-Stream interface descriptions
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


package Axi4Stream is
	type Axi4Stream_Interface is record
		-- Handshake signals
		Valid     : std_ulogic;
		Ready     : std_ulogic;

		-- Payload signals
		Data      : Data_Type;
		Keep      : Keep_Type;
		Last      : std_ulogic;

		-- Auxiliary signals
		User      : Data_Type;
	end record;

	view Axi4Stream_SenderView of Axi4Stream_Interface is
		-- Handshake signals
		Valid     : out;
		Ready     : in;

		-- Payload signals
		Data      : out;
		Keep      : out;
		Last      : out;

		-- Auxiliary signals
		User      : out;
	end view;
	alias Axi4Stream_ReceiverView is Axi4Stream_SenderView'converse;

end package;
