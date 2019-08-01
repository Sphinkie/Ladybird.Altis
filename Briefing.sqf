waitUntil { !isNil {player} };
waitUntil { player == player };

// ----------------------------------------------------------------------------------------------------------
// Diary (ordre d'affiche inversé pour le Diary)
// ----------------------------------------------------------------------------------------------------------

player createDiaryRecord ["Situation", ["Situation à Pyrgos", "L'ennemi bombarde la ville et nos positions, mais on attend des renforts pour faire taire leur artillerie."]];
player createDiaryRecord ["Diary", ["Credits", "Mission réalisée par Sphinkie."]];
player createDiaryRecord ["Diary", ["Delta team", "L'équipe <marker name='marker_7'>Delta</marker> tient la Base Aérienne."]];
player createDiaryRecord ["Diary", ["Charlie team", "L'équipe Charlie protège les routes d'accès à la base aérienne."]];
player createDiaryRecord ["Diary", ["Bravo team", "L'équipe <marker name='marker_8'>Bravo</marker> surveille un parc de véhicules, abrités dans un cimetière à l'Est de Pyrgos."]];
player createDiaryRecord ["Diary", ["Alpha team", "L'équipe <marker name='marker_6'>Alpha</marker> tient la ville de Pyrgos, malgré les bombardements et les snipers ennemis."]];


// ----------------------------------------------------------------------------------------------------------
// On définit les différentes taches de la mission
// ----------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------
// -- Methode des SimpleTask 'https://community.bistudio.com/wiki/Tasks:
// createSimpleTask ["Titre Menu briefing"];
// setSimpleTaskDescription ["Description de l'objectif", "Titre Menu briefing", "Titre marqueur carte"];
// setSimpleTaskDestination (getMarkerPos "CZ");
// Inconvenient: on ne sait pas après si la tache existe ou pas...
// ----------------------------------------------------------------------------------------------------------
// -- Methode des fonctions BIS:
// [...] call BIS_fnc_taskCreate;
// [...] call BIS_fnc_taskSetDescription;
// [...] call BIS_fnc_taskSetDestination;
// optionals (par defaut, des notifications apparaissent déjà lorsqu'uen atche est effectuée):
// ["TaskSucceeded",["","Rejoindre l'hélicoptère."]] call BIS_fnc_showNotification;
// ["TaskAssigned",["","Rejoignez la Landing Zone prévue."]] call BIS_fnc_showNotification;
// player call BIS_fnc_tasksUnit;		// affiche la liste des taches
// ----------------------------------------------------------------------------------------------------------

FNC_taskParking = 
{
	[ player, "taskParking",["","",""], objNull,"CREATED",4, true,"talk"] call BIS_fnc_taskCreate;
	[ "taskParking",["Rejoindre l'escouade située près du cimetière, à l'ouest de Pyrgos. Se présenter à l'officier responsable, et emprunter un véhicule. ","Emprunter  un véhicule au vieux cimetière","Parking"]] call BIS_fnc_taskSetDescription;
	[ "taskParking","parking"] call BIS_fnc_taskSetDestination;
	// Affichage des markers
	"marker_39" setMarkerAlpha 1;
};


FNC_taskHeli = 
{
	// owner,taskID,[description], destination, state, priority, showNotification, type
	[ player,"taskHeli",["","",""], objNull,"CREATED",4, true,"heli"] call BIS_fnc_taskCreate;
	// description = ["description", "title", "marker"]
	["taskHeli",["Embarquez dans l'helicoptère qui vous attend au <marker name='H3'>Hangar 3</marker>.","Embarquer dans l'hélicoptère","Hélico"]] call BIS_fnc_taskSetDescription;
	["taskHeli","H3"] call BIS_fnc_taskSetDestination;
	// Affichage des markers
	"H3" setMarkerAlpha 1;
};

FNC_taskLandingzone = 
{
	[ player,"taskLandingZone",["","",""], objNull,"CREATED",3, true,"land"] call BIS_fnc_taskCreate;
	["taskLandingZone", 
		["Rejoignez la <marker name='LZ'>LandingZone</marker> en suivant le plan de vol, et parlez à notre correspondant sur site. Il vous fournira des quads.",
		 "Rejoindre Landing Zone","Landing Zone"
		 ] ]call BIS_fnc_taskSetDescription;
	// Affichage des markers
	"LZ" setMarkerAlpha 1;
	"marker_15" setMarkerAlpha 1;
	"marker_16" setMarkerAlpha 1;
	"marker_17" setMarkerAlpha 1;
	"marker_18" setMarkerAlpha 1;
	"marker_19" setMarkerAlpha 1;
	"marker_20" setMarkerAlpha 1;
	"marker_21" setMarkerAlpha 1;
	"marker_22" setMarkerAlpha 1;
	"marker_23" setMarkerAlpha 1;
	"marker_24" setMarkerAlpha 1;
};

FNC_taskCrashzone = 
{
	[ player, "taskCrashzone", ["","",""], objNull,"CREATED", 2, true, "search"] call BIS_fnc_taskCreate;
	["taskCrashzone", 
		["Identifiez et rejoignez la zone du <marker name='CZ'>crash</marker> de notre hélicoptère de reconnaissance et recupérez les rescapés.",
		"Trouvez la zone du crash et les survivants.","Crash Zone"]]call BIS_fnc_taskSetDescription;
	// Affichage des markers
	"CZ" setMarkerAlpha 1;
};

FNC_taskEvac = 
{
	[ player, "taskEvac", ["","",""], objNull, "CREATED", 1, true, "takeoff"] call BIS_fnc_taskCreate;
	["taskEvac", 
	  ["Rendez les Quads et ramenez les survivants à la <marker name='TC'>base</marker>.",
	  "Ramener les survivants à la base.","Evac"]] call BIS_fnc_taskSetDescription;
};


/* Exemple de creation de SimpleTask:
	taskLandingZone = player createSimpleTask ["Rejoindre la LZ"];
	taskLandingZone setSimpleTaskDescription ["Rejoignez la <marker name='LZ'>LandingZone</marker>, et parlez à notre correspondant sur site. Il vous fournira des quads.","Rejoindre Landing Zone","Landing Zone"];
	taskLandingZone setTaskState "Created";
	taskLandingZone setSimpleTaskDestination (getMarkerPos "LZ"); 	// Affichage de l'objectif sur la carte.
	...
	player setCurrentTask taskLandingZone; 

*/

// ----------------------------------------------------------------------------------------------------------
// Fonctions pour la fin des taches.
// ----------------------------------------------------------------------------------------------------------

FNC_taskHeli_Done =
{
	if (["taskHeli"] call BIS_fnc_taskExists) then { ["taskHeli" ,"SUCCEEDED"] call BIS_fnc_taskSetState; };
	sleep 3;
	// Tache suivante: rejoindre la LZ. (On crée la tache si elle n'existe pas).
	if !(["taskLandingZone"] call BIS_fnc_taskExists) 
	then { 
		hint "Task created";
		call FNC_taskLandingzone;
		};
	"taskLandingZone" call BIS_fnc_taskSetCurrent;
	["taskLandingZone","LZ"] call BIS_fnc_taskSetDestination; 	// Affichage de l'objectif sur la carte.
};

FNC_taskLandingzone_Done =
{
	if (["taskLandingzone"] call BIS_fnc_taskExists) then { ["taskLandingzone" ,"SUCCEEDED"] call BIS_fnc_taskSetState;};
	sleep 3;
	// Tache suivante: rejoindre la CZ. (On  crée la tache si elle n'existe pas).
	if !(["taskCrashzone"] call BIS_fnc_taskExists) 
	then { 
		hint "Task created";
		call FNC_taskCrashzone;
		};
	"taskCrashzone" call BIS_fnc_taskSetCurrent;
	["taskCrashzone","CZ"] call BIS_fnc_taskSetDestination; 	// Affichage de l'objectif sur la carte.
};

FNC_taskCrashzone_Done =
{
	if (["taskCrashzone"] call BIS_fnc_taskExists) then { ["taskCrashzone" ,"SUCCEEDED"] call BIS_fnc_taskSetState;};
	sleep 3;
	// Tache suivante: évacuation.  (On  crée la tache si elle n'existe pas).
	if !(["taskEvac"] call BIS_fnc_taskExists)
	then {
		hint "Task created";
		call FNC_taskEvac;
		};
	"taskEvac" call BIS_fnc_taskSetCurrent;
	["taskEvac","Depot"] call BIS_fnc_taskSetDestination; 	// Affichage de l'objectif sur la carte.
	// on donne une description plus précise.
	["taskEvac", 
	  ["Ramenez les Quads au <marker name='Depot'>dépot</marker>, récupérez l'<marker name='LZ'>hélicoptère</marker> et retournez à la <marker name='TC'>base</marker>",
	  "Ramener les survivants.","Evac"]] call BIS_fnc_taskSetDescription;

	"Depot" setMarkerAlpha 1;
};


FNC_taskEvac_Done =
{
	if (["taskEvac"] call BIS_fnc_taskExists) then { ["taskEvac" ,"SUCCEEDED"] call BIS_fnc_taskSetState;};
};