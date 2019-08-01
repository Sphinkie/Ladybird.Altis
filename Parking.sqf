// --------------------------------------------------------------
// Arrivée au depot de véhicules près de Pyrgos
// --------------------------------------------------------------


// --------------------------------------------------------------
// Dialogue
// --------------------------------------------------------------

parkingofficer setRandomLip true; 
parkingofficer sideChat "Le capitaine Muller m'a prévenu. Vous pouvez prendre un véhicule ici.";
parkingofficer say "parking1";
sleep 3;
parkingofficer setRandomLip false;
sleep 2;

parkingofficer setRandomLip true; 
parkingofficer sideChat "Suivez la route vers l'Ouest jusqu'au centre ville, puis prenez à droite la route vers Athira.";
parkingofficer say "parking2";
sleep 3;
parkingofficer setRandomLip false;
sleep 2;

parkingofficer setRandomLip true; 
parkingofficer sideChat "Restez bien sur la route pour éviter les mines.";
parkingofficer say "parking3";
sleep 3;
parkingofficer setRandomLip false;
sleep 5;

// --------------------------------------------------------------
// Next Task
// --------------------------------------------------------------
if (["taskParking"] call BIS_fnc_taskExists) then { ["taskParking" ,"SUCCEEDED"] call BIS_fnc_taskSetState;};
"marker_39" setMarkerAlpha 0;
"taskBase" call BIS_fnc_taskSetCurrent;
