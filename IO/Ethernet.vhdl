-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 Ethernet interface descriptions
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

use     work.Common.all;


-- Signal name mappings
-- MDC  -> Management data clock
-- MDIO -> Management data input/output
package Ethernet is
	-- MDIO
	type MDIO_PcbInterface is record
		MDC  : std_logic;
		MDIO : std_logic;
	end record;

	view MDIO_Controller_PcbView of MDIO_PcbInterface is
		MDC  : out;
		MDIO : inout;
	end view;
	alias MDIO_PHY_PcbView is MDIO_Controller_PcbView'converse;


	type MDIO_Interface is record
		MDC  : std_ulogic;
		MDIO : Tristate_Interface;
	end record;

	view MDIO_ControllerView of MDIO_Interface is
		MDC  : out;
		MDIO : view Tristate_OutView;
	end view;
	alias MDIO_IobView is MDIO_ControllerView'converse;

	-- View of MDIO on device site?


	-- RMII
	type RMII_TX_Interface is record
		TXD    : std_logic_vector(1 downto 0);   -- Transmit data
		TX_EN  : std_logic;                      -- Transmit enable (valid)
	end record;

	type RMII_RX_Interface is record
		RXD    : std_logic_vector(1 downto 0);   -- Receive data
		CRS_DV : std_logic;                      -- Receive carried sense
		RX_ER  : std_logic;                      -- Receive error
	end record;


	-- MII
	type MII_TX_Interface is record
		TX_CLK : std_logic;                      -- Transmit clock (from PHY)
		TXD    : std_logic_vector(3 downto 0);   -- Transmit data
		TX_EN  : std_logic;                      -- Transmit enable (valid)
		TX_ER  : std_logic;                      -- Transmit error
	end record;

	type MII_RX_Interface is record
		RX_CLK : std_logic;                      -- Receive clock (from PHY)
		RXD    : std_logic_vector(3 downto 0);   -- Receive data
		RX_DV  : std_logic;                      -- Receive data valid
		RX_ER  : std_logic;                      -- Receive error
		CRS    : std_logic;                      -- Receive carried sense
		COL    : std_logic;                      -- Receive collision detect
	end record;


	-- RGMII
	type RGMII_TX_Interface is record
		TXC    : std_logic;                      -- Transmit clock (from MAC)
		TXD    : std_logic_vector(7 downto 0);   -- Transmit data
		TX_CTL : std_logic;                      -- Transmit control (enable (valid) and error)
	end record;

	type RGMII_HalfDuplex_RX_Interface is record
		RXC    : std_logic;                      -- Receive clock (from PHY)
		RXD    : std_logic_vector(3 downto 0);   -- Receive data
		RX_CTL : std_logic;                      -- Receive control (data valid and error)
	end record;


	-- GMII
	type GMII_HalfDuplex_TX_Interface is record
		TXCLK  : std_logic;                      -- Transmit clock (from MAC)
		TXD    : std_logic_vector(7 downto 0);   -- Transmit data
		TX_EN  : std_logic;                      -- Transmit enable (valid)
		TX_ER  : std_logic;                      -- Transmit error
	end record;

	type GMII_HalfDuplex_RX_Interface is record
		RXCLK  : std_logic;                      -- Receive clock (from PHY)
		RXD    : std_logic_vector(3 downto 0);   -- Receive data
		RXDV   : std_logic;                      -- Receive data valid
		RXER   : std_logic;                      -- Receive error
		CS     : std_logic;                      -- Receive carried sense
		COL    : std_logic;                      -- Receive collision detect
	end record;

	alias GMII_FullDuplex_TX_Interface is GMII_HalfDuplex_TX_Interface;

	type GMII_FullDuplex_RX_Interface is record
		RXCLK  : std_logic;                      -- Receive clock (from PHY)
		RXD    : std_logic_vector(3 downto 0);   -- Receive data
		RXDV   : std_logic;                      -- Receive data valid
		RXER   : std_logic;                      -- Receive error
	end record;


	-- XGMII
	type XGMII_TX_Interface is record
		TXD    : std_logic_vector(63 downto 0);  -- Transmit data
		TXC    : std_logic_vector(7 downto 0);   -- Transmit control
	end record;

	type XGMII_RX_Interface is record
		RXD    : std_logic_vector(63 downto 0);  -- Transmit data
		RXC    : std_logic_vector(7 downto 0);   -- Transmit control
	end record;


	-- SGMII
	alias SGMII_Interface is DifferentialLane_Interface;

	type SGMII_withRefClock_Interface is record
		Clock : Differatial_Interface;
		TX    : Differatial_Interface;
		RX    : Differatial_Interface;
	end record;


	-- QGMII
	type QSGMII_Interface is record
		TX    : Differatial_Interface_Vector(3 downto 0);
		RX    : Differatial_Interface_Vector(3 downto 0);
	end record;

	type QSGMII_withRefClock_Interface is record
		Clock : Differatial_Interface;
		TX    : Differatial_Interface_Vector(3 downto 0);
		RX    : Differatial_Interface_Vector(3 downto 0);
	end record;

	-- RXAUI
	-- 2 lanes á 6.25 Gbps

	-- XAUI
	-- 4 lanes á 3.125 Gbps

end package;
