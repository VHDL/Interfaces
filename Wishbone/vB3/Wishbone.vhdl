-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   VHDL-2019 Wishbone interface descriptions
--
-- Description:
--   Signal names match Wishbone B.4 specification (Cyc, Stb, Ack, Err, etc.)
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

use work.WishboneCommon.all;

package Wishbone is
	-- Classic Wishbone Interface (matching spec signal names)
	type Wishbone_Interface is record
		-- Master signals (outputs from master perspective)
		Cyc       : bit;            -- CYC_O - Cycle
		Stb       : bit;            -- STB_O - Strobe
		We        : bit;            -- WE_O  - Write Enable
		Addr      : Addr_Type;      -- ADR_O - Address
		Dat_m     : Data_Type;      -- DAT_O - Data (Master to Slave)
		Sel       : Sel_Type;       -- SEL_O - Select
		
		-- Slave signals (outputs from slave perspective)
		Ack       : bit;            -- ACK_I - Acknowledge
		Err       : bit;            -- ERR_I - Error
		Rty       : bit;            -- RTY_I - Retry
		Dat_s     : Data_Type;      -- DAT_I - Data (Slave to Master)
		
		-- Optional signals for pipelined/burst modes
		Cti       : Cti_Type;       -- CTI_O - Cycle Type Identifier
		Bte       : Bte_Type;       -- BTE_O - Burst Type Extension
		
		-- Optional tag signals
		Tgd_m     : Tgd_Type;       -- TGD_O - Tag Data (Master)
		Tgd_s     : Tgd_Type;       -- TGD_I - Tag Data (Slave)
		Tga       : Tga_Type;       -- TGA_O - Tag Address
		Tgc       : Tgc_Type;       -- TGC_O - Tag Cycle
		
		-- Optional signals
		Lock      : bit;            -- LOCK_O - Lock
		Stall     : bit;            -- STALL_I - Pipeline stall
	end record;
	type Wishbone_Interface_Vector is array(natural range <>) of Wishbone_Interface;

	-- Master view (from master's perspective)
	view Wishbone_MasterView of Wishbone_Interface is
		-- Master outputs
		Cyc       : out;
		Stb       : out;
		We        : out;
		Addr      : out;
		Dat_m     : out;
		Sel       : out;
		Cti       : out;
		Bte       : out;
		Tgd_m     : out;
		Tga       : out;
		Tgc       : out;
		Lock      : out;
		
		-- Master inputs (slave outputs)
		Ack       : in;
		Err       : in;
		Rty       : in;
		Dat_s     : in;
		Tgd_s     : in;
		Stall     : in;
	end view;
	alias Wishbone_SlaveView is Wishbone_MasterView'converse;

	-- Simplified interface without optional signals
	type Wishbone_Simple_Interface is record
		-- Master signals
		Cyc       : bit;
		Stb       : bit;
		We        : bit;
		Addr      : Addr_Type;
		Dat_m     : Data_Type;
		Sel       : Sel_Type;
		
		-- Slave signals
		Ack       : bit;
		Dat_s     : Data_Type;
	end record;
	type Wishbone_Simple_Interface_Vector is array(natural range <>) of Wishbone_Simple_Interface;

	view Wishbone_Simple_MasterView of Wishbone_Simple_Interface is
		-- Master outputs
		Cyc       : out;
		Stb       : out;
		We        : out;
		Addr      : out;
		Dat_m     : out;
		Sel       : out;
		
		-- Master inputs
		Ack       : in;
		Dat_s     : in;
	end view;
	alias Wishbone_Simple_SlaveView is Wishbone_Simple_MasterView'converse;

end package;