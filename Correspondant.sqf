// ---------------------------------------------------------------
// Script pour TrgCorrespondant (on approche du correspondant)
// ---------------------------------------------------------------
// hint "TrgCorrespondant";


// ---------------------------------------------------------------
// Dialogue
// ---------------------------------------------------------------
correspondant setRandomLip true; 
correspondant globalChat "Follow me. And take care of the patrols.";
correspondant say "corres02";
sleep 3;
correspondant globalChat "Hurry. It is not safe for me to stay here.";
correspondant say "corres03";
sleep 3;
correspondant setRandomLip false;
sleep 3;

//[correspondant, ""] call BIS_fnc_ambientAnim;
// correspondant setCurrentWaypoint WP_1
