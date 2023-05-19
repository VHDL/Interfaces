-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 UART interface descriptions
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

-- Signal name mappings
-- TX -> Transmit Data (TxD)
-- RX -> Receive Data (RxD)
package UART is
	type UART_Interface is record
		RX : std_logic;
		TX : std_logic;
	end record;

	view UART_TransmitterView of UART_Interface is
		TX  : out;
		RX  : in;
	end view;
	alias UART_ReceiverView is UART_TransmitterView'converse;

	type UART_Interface_Vector is array(natural range <>) of UART_Interface;
end package;
