// -------------------------------------------------------------
// Script pour trigger TrgCrashZone "Arrivée sur la CrashZone"
// -------------------------------------------------------------
//hint "TrgCrashZone"; 
hint "Vous avez retrouvé l'hélicoptère !";

// -------------------------------------------------------------
// Les deux survivants rejoignent le groupe
// -------------------------------------------------------------
pilote move position player;
copilote move position player;
sleep 3;
hint "Les pilotes rejoignent votre groupe";
[pilote,copilote] join (group player);
pilote setBehaviour "SAFE";
copilote setBehaviour "SAFE";

// -------------------------------------------------------------
// Dialogue
// -------------------------------------------------------------
pilote setGroupID ["survivor pilot"];
sleep 3;
pilote sideChat "Salut les gars, on vous attendait avec impatience!";
pilote say "pilote1";
sleep 3;
pilote sideChat "On vous suit. Ramenez-nous à la base.";
pilote say "pilote2";


// ---------------------------------------------
// Objectif facultatif
// ---------------------------------------------
cutText ["Rappel: détruisez l'hélicoptère. \nRien ne doit tomber aux mains ennemies.", "PLAIN"];
// ---------------------------------------------
// Assignation de la tache suivante
// ---------------------------------------------
call FNC_taskCrashzone_Done;	// La CrashZone a été trouvée

// ---------------------------------------------
// Debug
// ---------------------------------------------
/*
 hint count units group player;
 hint group gluck;
 pilote setPos [getMarkerPos "Athira" select 0, getMarkerPos "Athira" select 1, 0];
 me setPos [getMarkerPos "TC" select 0, getMarkerPos "TC" select 1, 0];
 me setPos [getMarkerPos "LZ" select 0, getMarkerPos "LZ" select 1, 0];
*/

// ---------------------------------------------
// On enleve les deux paysans du dépot
// ---------------------------------------------
hideObject paysan1;
hideObject paysan2;

// ---------------------------------------------
// Le colonel Gluck change de place (marker "TC")
// ---------------------------------------------
//gluck enableAI "MOVE";
//gluck enableAI "PATH";
//gluck enableAI "ALL";
gluck call BIS_fnc_ambientAnim__terminate;	// pour ne pas que le perso revienne automatiquement à sa place
gluck setPos [ getMarkerPos "TC" select 0, getMarkerPos "TC" select 1, 0 ];
[gluck, "GUARD", "ASIS"] call BIS_fnc_ambientAnim; 

/*
// autres possibilités:
gluck setPosATL [5730, 21422,0];
gluck setVehiclePosition [[getMarkerPos "TC" select 0, getMarkerPos "TC" select 1, 0 ], [], 0, "NONE"];

*/

// ---------------------------------------------
// Mise en place de l'embuscade Opfor à la LZ
// ---------------------------------------------
ambush1 setPos [(getMarkerPos "LZ" select 0)+5,  ( getMarkerPos "LZ" select 1)-5, 0 ]; 
ambush2 setPos [(getMarkerPos "LZ" select 0)-5,  ( getMarkerPos "LZ" select 1)+5, 0 ]; 
ifrit   setPos [(getMarkerPos "LZ" select 0)+35, ( getMarkerPos "LZ" select 1)-20, 0 ]; 

