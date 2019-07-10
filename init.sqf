// ---------------------------------------------------------
// This file is run by Arma3 at the START
// ---------------------------------------------------------

// ---------------------------------------------------------
// On rend les markers invisibles sur la carte
// ---------------------------------------------------------
"marker_15" setMarkerAlpha 0;
"marker_16" setMarkerAlpha 0;
"marker_17" setMarkerAlpha 0;
"marker_18" setMarkerAlpha 0;
"marker_19" setMarkerAlpha 0;
"marker_20" setMarkerAlpha 0;
"marker_21" setMarkerAlpha 0;
"marker_22" setMarkerAlpha 0;
"marker_23" setMarkerAlpha 0;
"marker_24" setMarkerAlpha 0;
"marker_39" setMarkerAlpha 0;
"LZ" setMarkerAlpha 0;
"CZ" setMarkerAlpha 0;
"TC" setMarkerAlpha 0;
"H3" setMarkerAlpha 0;
"Depot" setMarkerAlpha 0;

// ---------------------------------------------------------
// Début de la mission
// ---------------------------------------------------------
cutText ["Le capitaine Muller veut vous voir, dans le batiment voisin.", "PLAIN"];
execVM "briefing.sqf";