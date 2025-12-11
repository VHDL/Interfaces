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

library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

use     work.AvalonCommon.all;

package AvalonMM is
	-- Avalon Memory-Mapped Interface (matching spec signal names)
	type AvalonMM_Interface is record
		-- Master signals
		Address            : Address_Type;      -- Address
		Read               : std_ulogic;        -- Read request
		Write              : std_ulogic;        -- Write request
		WriteData          : Data_Type;         -- Write data
		ByteEnable         : ByteEnable_Type;   -- Byte enable
		
		-- Slave signals
		ReadData           : Data_Type;         -- Read data
		ReadDataValid      : std_ulogic;        -- Read data valid
		WaitRequest        : std_ulogic;        -- Wait request
		Response           : Response_Type;     -- Response
		
		-- Optional burst signals
		BurstCount         : BurstCount_Type;   -- Burst count
		
		-- Optional pipelining signals
		WriteResponseValid : std_ulogic;        -- Write response valid
		
		-- Optional lock signal
		Lock               : std_ulogic;        -- Lock
		
		-- Optional debug signals
		DebugAccess        : std_ulogic;        -- Debug access
	end record;
	type AvalonMM_Interface_Vector is array(natural range <>) of AvalonMM_Interface;

	-- Master view (from master's perspective)
	view AvalonMM_MasterView of AvalonMM_Interface is
		-- Master outputs
		Address            : out;
		Read               : out;
		Write              : out;
		WriteData          : out;
		ByteEnable         : out;
		BurstCount         : out;
		Lock               : out;
		DebugAccess        : out;
		
		-- Master inputs (slave outputs)
		ReadData           : in;
		ReadDataValid      : in;
		WaitRequest        : in;
		Response           : in;
		WriteResponseValid : in;
	end view;
	alias AvalonMM_SlaveView is AvalonMM_MasterView'converse;

	-- Simplified interface without optional signals
	type AvalonMM_Simple_Interface is record
		-- Master signals
		Address     : Address_Type;
		Read        : std_ulogic;
		Write       : std_ulogic;
		WriteData   : Data_Type;
		ByteEnable  : ByteEnable_Type;
		
		-- Slave signals
		ReadData    : Data_Type;
		WaitRequest : std_ulogic;
	end record;
	type AvalonMM_Simple_Interface_Vector is array(natural range <>) of AvalonMM_Simple_Interface;

	view AvalonMM_Simple_MasterView of AvalonMM_Simple_Interface is
		-- Master outputs
		Address     : out;
		Read        : out;
		Write       : out;
		WriteData   : out;
		ByteEnable  : out;
		
		-- Master inputs
		ReadData    : in;
		WaitRequest : in;
	end view;
	alias AvalonMM_Simple_SlaveView is AvalonMM_Simple_MasterView'converse;

end package;