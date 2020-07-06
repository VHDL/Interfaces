-- EMACS settings: -*-	tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:         Patrick Lehmann
--
-- Package:         VHDL-2019 MIPI M-PHY interface descriptions
--
-- Description:
-- -------------------------------------
-- This package
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


package MPHY is
	type MPHY_Interface is record
		TX : Differatial_Interface_Vector;
		RX : Differatial_Interface_Vector;
	end record;

	view MPHY_OutView of MPHY_Interface is
		TX : view ( Differatial_OutView );
		RX : view ( Differatial_InView  );
	end view;
	alias Differatial_InView is Differatial_OutView'converse;

end package;
