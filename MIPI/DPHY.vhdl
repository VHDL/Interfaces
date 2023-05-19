-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 MIPI D-PHY interface descriptions
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

use     work.Common.all;


package DPHY is
	type DPHY_Interface is record
		Clock : Differatial_Interface;
		Data  : Differatial_Interface_Vector;
	end record;

	view DPHY_OutView of DPHY_Interface is
		Clock : view Differatial_OutView;
		Data  : view ( Differatial_OutView );
	end view;
	alias DPHY_InView is DPHY_OutView'converse;

	type DPHY_Interface_Vector is
		array(natural range <>)
		of DPHY_Interface;
end package;
