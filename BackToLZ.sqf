// ----------------------------------------------------------------
// Script pour TrgBackToLZ (retour au depot avec les survivants)
// ----------------------------------------------------------------


// ----------------------------------------------------------------
// Le correspondant accourt
// ----------------------------------------------------------------
correspondant setSpeedMode "FULL";
correspondant move position player; 
correspondant switchMove "Acts_JetsShooterIdleMoveaway_loop_m";

// ----------------------------------------------------------------
// Dialogue
// ----------------------------------------------------------------
sleep 3;
correspondant setRandomLip true; 
correspondant say "corres20";
sleep 1;
correspondant say "corres21";
sleep 3;
correspondant setRandomLip false;
sleep 3;

correspondant switchMove "Acts_CivilIdle_1";


// ---------------------------------------------
// Fin de la tache.
// ---------------------------------------------
call FNC_taskEvac_Done;
sleep 3;
hint "Prenez l'hélico et rentrez à la base.";
["TaskAssigned",["","Retournez à la base, voir le Col. Gluck."]] call BIS_fnc_showNotification;
