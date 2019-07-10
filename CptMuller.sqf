// ----------------------------------------------------------------------------
// Briefing du Capitaine Muller
// ----------------------------------------------------------------------------

muller switchMove "Acts_B_briefings";
sleep 4;

// ----------------------------------------------------------------------------
// Briefing
// ----------------------------------------------------------------------------
muller setRandomLip true; 
muller sideChat "Les gars, le Colonel Gluck vous attend à la Base Aérienne.";
muller say "muller1";
sleep 4;
muller sideChat "Prenez un véhicule au vieux cimetière, à l'Est de la ville, et allez le voir."; 
muller say "muller2";
sleep 5;
muller sideChat "Rompez!";
muller say "muller3";
sleep 2;
muller setRandomLip false;
sleep 5;

// ----------------------------------------------------------------------------
// Next Task
// ----------------------------------------------------------------------------
call FNC_taskParking;
"taskParking" call BIS_fnc_taskSetCurrent;

// ----------------------------------------------------------------------------
// Hint
// ----------------------------------------------------------------------------
hint "Rejoignez le cimetière à l'Est de Pyrgos";
