-- =============================================================================
-- Authors:
--   Patrick Lehmann
--
-- Package:
--   VHDL-2019 Command-Status-Error interface description
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

package CSE is
	generic (
		type T_Command is (<>); --> Not yet supported by Riviera-PRO 2020.04
		type T_Status  is (<>); --> Not yet supported by Riviera-PRO 2020.04
		type T_Error   is (<>)  --> Not yet supported by Riviera-PRO 2020.04
	);

	type CSE_Interface is record
		Command : T_Command;
		Status  : T_Status;
		Error   : T_Error;
	end record;
	type CSE_Interface_Vector is array(natural range <>) of CSE_Interface;

	view CSE_OutView of CSE_Interface is
		Command : out;
		Status  : in;
		Error   : in;
	end view;
	alias CSE_InView is CSE_OutView'converse;

end package;
