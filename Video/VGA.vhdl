-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:         Patrick Lehmann
--
-- Package:         VHDL-2019 VGA interface descriptions
--
-- Description:
-- -------------------------------------
-- This package 
--
--    VESA Standard
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


-- Signal name mappings
-- DDC -> VESA Display Data Channel
package VGA is
	type SimpleVGA_Interface is record
		Red            : unresolved_unsigned;
		Green          : unresolved_unsigned;
		Blue           : unresolved_unsigned;
		HorizontalSync : std_ulogic;
		VerticalSync   : std_ulogic;
	end record;

	view SimpleVGA_SenderView of SimpleVGA_Interface is
		Red            : out;
		Green          : out;
		Blue           : out;
		HorizontalSync : out;
		VerticalSync   : out;
	end view;
	alias SimpleVGA_ReceiverView is SimpleVGA_SenderView'converse;

	type SimpleVGA_Interface_Vector is array(natural range <>) of SimpleVGA_Interface;




	type VGA_PCB_Interface is record
		Video : SimpleVGA_Interface;
		DDC   : I2C_PCB_Interface;
	end record;

	view VGA_PCB_ControllerView of VGA_PCB_Interface is
		Video : view SimpleVGA_SenderView;
		DDC   : view I2C_PCB_View;
	end view;
	alias VGA_PCB_MonitorView is VGA_PCB_ControllerView'converse;

	type VGA_PCB_Interface_Vector is array(natural range <>) of VGA_PCB_Interface;




	type VGA_Interface is record
		Video : SimpleVGA_Interface;
		DDC   : I2C_Interface;
	end record;

	view VGA_SenderView of VGA_Interface is
		Video : view SimpleVGA_SenderView;
		DDC   : view I2C_ControllerView;
	end view;
	alias VGA_ReceiverView is VGA_SenderView'converse;

	type VGA_Interface_Vector is array(natural range <>) of VGA_Interface;

end package;
