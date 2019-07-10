// ----------------------------------------------------------------------
// Script pour commander le bombardement par les opfor
// en ajoutant un peu d'aléatoire dans la position de la cible
// ----------------------------------------------------------------------


sleep 10;


for "_i" from 0 to 100 do   				// Nombre de salves
{
	_mortar = artillery_1;
	_center = markerPos "Marker_6";     //--- central point around which the mortar rounds will hit
	_radius = 150;                      //--- random radius from the center

	_pos = [
		(_center select 0) - _radius + (2 * random _radius),
		(_center select 1) - _radius + (2 * random _radius),
		0
		];

	artillery_1 commandArtilleryFire [_pos, getArtilleryAmmo [artillery_1] select 0, 1]; // 1 tir par salve
	sleep 10; 				//--- delay between rounds (salves)
	artillery_2 commandArtilleryFire [_pos, getArtilleryAmmo [artillery_2] select 0, 1];
	sleep 20; 				//--- delay between rounds (salves)

};




