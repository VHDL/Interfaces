-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   VHDL-2019 Avalon Memory-Mapped (Avalon-MM) interface descriptions
--
-- Description:
--   Signal names match Avalon specification (address, writedata, readdata, etc.)
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

package AvalonMM is
	-- Avalon Memory-Mapped Interface (matching spec signal names)
	type AvalonMM_Interface is record
		-- Master signals (names match Avalon spec exactly)
		address         : Address_Type;      -- Address
		read            : bit;               -- Read request
		write           : bit;               -- Write request
		writedata       : Data_Type;         -- Write data
		byteenable      : ByteEnable_Type;   -- Byte enable
		
		-- Slave signals
		readdata        : Data_Type;         -- Read data
		readdatavalid   : bit;               -- Read data valid
		waitrequest     : bit;               -- Wait request
		response        : Response_Type;     -- Response
		
		-- Optional burst signals
		burstcount      : BurstCount_Type;   -- Burst count
		
		-- Optional pipelining signals
		writeresponsevalid : bit;            -- Write response valid
		
		-- Optional lock signal
		lock            : bit;               -- Lock
		
		-- Optional debug signals
		debugaccess     : bit;               -- Debug access
	end record;
	type AvalonMM_Interface_Vector is array(natural range <>) of AvalonMM_Interface;

	-- Master view (from master's perspective)
	view AvalonMM_MasterView of AvalonMM_Interface is
		-- Master outputs
		address         : out;
		read            : out;
		write           : out;
		writedata       : out;
		byteenable      : out;
		burstcount      : out;
		lock            : out;
		debugaccess     : out;
		
		-- Master inputs (slave outputs)
		readdata        : in;
		readdatavalid   : in;
		waitrequest     : in;
		response        : in;
		writeresponsevalid : in;
	end view;
	alias AvalonMM_SlaveView is AvalonMM_MasterView'converse;

	-- Simplified interface without optional signals
	type AvalonMM_Simple_Interface is record
		-- Master signals
		address         : Address_Type;
		read            : bit;
		write           : bit;
		writedata       : Data_Type;
		byteenable      : ByteEnable_Type;
		
		-- Slave signals
		readdata        : Data_Type;
		waitrequest     : bit;
	end record;
	type AvalonMM_Simple_Interface_Vector is array(natural range <>) of AvalonMM_Simple_Interface;

	view AvalonMM_Simple_MasterView of AvalonMM_Simple_Interface is
		-- Master outputs
		address         : out;
		read            : out;
		write           : out;
		writedata       : out;
		byteenable      : out;
		
		-- Master inputs
		readdata        : in;
		waitrequest     : in;
	end view;
	alias AvalonMM_Simple_SlaveView is AvalonMM_Simple_MasterView'converse;

end package;