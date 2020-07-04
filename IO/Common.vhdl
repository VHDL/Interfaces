library IEEE;
use     IEEE.std_logic_1164.all;

package Common is
	type T_DS is record
		P : std_logic;
		N : std_logic;
	end record;

	alias T_LVDS        is T_DS;

	view V_DS_Out of T_DS is
		P : out;
		N : out;
	end view;
	alias V_DS_In is V_DS_Out'converse;

	alias V_LVDS_Out is V_DS_Out;
	alias V_LVDS_In  is V_DS_In;

	type T_DS_Vector is array(natural range <>) of T_DS;

	alias T_LVDS_Vector is T_DS_Vector;



	type T_Lane is record
		TX : T_DS;
		RX : T_DS;
	end record;

	view V_Lane of T_Lane is
		TX : view V_DS_Out;
		RX : view V_DS_In;
	end view;

	type T_Lane_Vector is array(natural range <>) of T_Lane;




	type T_Tristate is record
		I : std_logic;
		O : std_logic;
		T : std_logic;
	end record;

	view V_Tristate_Out of T_Tristate is
		I : in;
		O : out;
		T : out;
	end view;
	alias V_Tristate_In is V_Tristate_Out'converse;

	type T_Tristate_Vector is array(natural range <>) of T_Tristate;
end package;
