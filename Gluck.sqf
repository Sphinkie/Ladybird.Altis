// --------------------------------------------------------------------------------------------------
// Briefing de Gluck
// --------------------------------------------------------------------------------------------------
gluck setRandomLip true; 
gluck sideChat "Bonjour Messieurs...";
gluck say "gluck1";
sleep 2;
gluck say "gluck2";
sleep 4;
gluck say "gluck3";
sleep 3;
gluck say "gluck4";
sleep 4;
gluck say "gluck5";
sleep 4;
gluck say "gluck6";
sleep 2;
gluck setRandomLip false;
sleep 1;

// --------------------------------------------------------------------------------------------------
// Create Diary Record
// --------------------------------------------------------------------------------------------------
player createDiaryRecord  ["Diary", ["Plan de Vol", "Décollez et mettez le cap au WNW. <br/>La Landing Zone prévue se trouve à 8km, aux coordonnées <marker name='LZ'>082201</marker>. <br/>Marquage visuel: Lumière bleue. <br/>Suivez les vallées. <br/>Discretion recommandée: 2 défenses sol-air signalées."]];
player createDiaryRecord  ["Diary", ["Ordre de Mission", "Un hélicoptère de reconnaissance en zone ennemie s'est écrasé dans le Nord de l'ile. <br/>Un Hummingbird est mis à votre disposition pour retrouver et ramener les rescapés éventuels. <br/>Rendez vous à la <marker name='LZ'>LZ</marker> où un correspondant vous attend. Il vous conduira à un <marker name='Dépot'>dépot ami</marker>, qui vous prètera deux quads. <br/>Retrouvez le lieu du <marker name='CZ'>crash</marker> dans la montagne, et récupérez les rescapés. <br/>Détruisez l'épave de l'hélicoptère au passage, il y a ce qu'il faut à bord de votre Hummingbird."]];
player createDiaryRecord  ["Situation", ["Situation dans le Nord", "L'ennemi est très présent dans les collines du nord de l'ile."]];

hint "Plan de Vol ajouté.";
sleep 2;
hint "Ordre de Mission ajouté.";



// --------------------------------------------------------------------------------------------------
// Création des nouvelles taches
// --------------------------------------------------------------------------------------------------
call FNC_taskHeli;		    // Embarquer dans hélicoptère
call FNC_taskLandingzone;	// Rejoindre la LandingZone 
call FNC_taskCrashzone;	    // Trouver la CrashZone
call FNC_taskEvac;          // Evacuer

"taskHeli" call BIS_fnc_taskSetCurrent;
