// detach CurrentCursorTarget;
_chairs = ["big_chair_civ","sofagris_civ","sillamedico2_civ","sillademedico_civ","Land_WoodenTable_large_F","vvv_lowmodel_mesaoficina","vvv_lowmodel_jukebox","vvv_lowmodel_comoda1","nopixel_tools_escritorio2","nopixel_tools_lampara2","nopixel_tools_mesa","nopixel_tools_planta"];

{
	if(typeof _x IN _chairs) then { hint "You cant drop furniture with this function"; } else { detach _x; };
} forEach attachedObjects player;

if(attachedcar) then {
	attachedcar = false;
};

