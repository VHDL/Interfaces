-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   VHDL-2019 Avalon Streaming (Avalon-ST) interface descriptions
--
-- Description:
--   Signal names match Avalon-ST specification (data, valid, ready, etc.)
--
-- License:
-- =============================================================================
-- Copyright 2025-2025 Open Source VHDL Group
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

use     work.AvalonCommon.all;

package AvalonST is
	-- Avalon Streaming Interface (matching spec signal names)
	type AvalonST_Interface is record
		-- Handshake signals
		Valid         : std_ulogic;            -- Valid
		Ready         : std_ulogic;            -- Ready
		
		-- Payload signals
		Data          : Data_Type;             -- Data
		
		-- Packet signals
		StartOfPacket : std_ulogic;            -- Start of packet
		EndOfPacket   : std_ulogic;            -- End of packet
		Empty         : std_ulogic_vector;     -- Empty (number of empty symbols)
		
		-- Error signal
		Error         : std_ulogic_vector;     -- Error
		
		-- Channel signal
		Channel       : std_ulogic_vector;     -- Channel
	end record;
	type AvalonST_Interface_Vector is array(natural range <>) of AvalonST_Interface;

	-- Source view (from source's perspective)
	view AvalonST_SourceView of AvalonST_Interface is
		-- Source outputs
		Valid         : out;
		Data          : out;
		StartOfPacket : out;
		EndOfPacket   : out;
		Empty         : out;
		Error         : out;
		Channel       : out;
		
		-- Source inputs (sink outputs)
		Ready         : in;
	end view;
	alias AvalonST_SinkView is AvalonST_SourceView'converse;

	-- Simplified interface without optional signals
	type AvalonST_Simple_Interface is record
		-- Handshake signals
		Valid : std_ulogic;
		Ready : std_ulogic;
		
		-- Payload signal
		Data  : Data_Type;
	end record;
	type AvalonST_Simple_Interface_Vector is array(natural range <>) of AvalonST_Simple_Interface;

	view AvalonST_Simple_SourceView of AvalonST_Simple_Interface is
		-- Source outputs
		Valid : out;
		Data  : out;
		
		-- Source inputs
		Ready : in;
	end view;
	alias AvalonST_Simple_SinkView is AvalonST_Simple_SourceView'converse;

end package;
