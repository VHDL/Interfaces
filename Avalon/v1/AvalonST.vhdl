-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   VHDL-2019 Avalon Streaming (Avalon-ST) interface descriptions
--
-- Description:
--   Signal names match Avalon-ST specification (data, valid, ready, etc.)
--   Uses native VHDL-2019 bit types
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

use work.AvalonCommon.all;

package AvalonST is
	-- Avalon Streaming Interface (matching spec signal names)
	type AvalonST_Interface is record
		-- Handshake signals
		valid           : bit;               -- Valid
		ready           : bit;               -- Ready
		
		-- Payload signals
		data            : Data_Type;         -- Data
		
		-- Packet signals
		startofpacket   : bit;               -- Start of packet
		endofpacket     : bit;               -- End of packet
		empty           : bit_vector;        -- Empty (number of empty symbols)
		
		-- Error signal
		error           : bit_vector;        -- Error
		
		-- Channel signal
		channel         : bit_vector;        -- Channel
	end record;
	type AvalonST_Interface_Vector is array(natural range <>) of AvalonST_Interface;

	-- Source view (from source's perspective)
	view AvalonST_SourceView of AvalonST_Interface is
		-- Source outputs
		valid           : out;
		data            : out;
		startofpacket   : out;
		endofpacket     : out;
		empty           : out;
		error           : out;
		channel         : out;
		
		-- Source inputs (sink outputs)
		ready           : in;
	end view;
	alias AvalonST_SinkView is AvalonST_SourceView'converse;

	-- Simplified interface without optional signals
	type AvalonST_Simple_Interface is record
		-- Handshake signals
		valid           : bit;
		ready           : bit;
		
		-- Payload signal
		data            : Data_Type;
	end record;
	type AvalonST_Simple_Interface_Vector is array(natural range <>) of AvalonST_Simple_Interface;

	view AvalonST_Simple_SourceView of AvalonST_Simple_Interface is
		-- Source outputs
		valid           : out;
		data            : out;
		
		-- Source inputs
		ready           : in;
	end view;
	alias AvalonST_Simple_SinkView is AvalonST_Simple_SourceView'converse;

end package;