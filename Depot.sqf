// -------------------------------------------------------
// Lors de l'arrivée de l'équipe au dépot
// -------------------------------------------------------
// hint "TrgDepot";

// -------------------------------------------------------
// Dialogue
// -------------------------------------------------------
sleep 2;
correspondant setRandomLip true; 
correspondant globalChat "This are friends. Your Quads are over there.";
correspondant say "corres10";
sleep 3;
correspondant globalChat "The crash was near Synneforos Mountain. You need to go there first: Bearing NW, 2 kilometers.";
correspondant say "corres11";
sleep 3;
correspondant globalChat "I wait for you here. Come back with your friends and the Quads.";
correspondant say "corres12";
sleep 3;  
correspondant globalChat "And beware of the ennemy patrols. Avoid the roads. They also have spotters on the top of the hills.";
correspondant say "corres13";
sleep 3;
correspondant globalChat "If they see you, they will call reinforcement immediately.";
correspondant say "corres14";
correspondant setRandomLip false;


// -------------------------------------------------------
// Au bout de quelques minutes, on a un message radio qui donne quelques infos en plus 
// pour aider à localiser la zone du crash
// -------------------------------------------------------
sleep 120;
Checkpoint globalRadio "RadioMsg10";
sleep 5;
Checkpoint globalRadio "RadioMsg11";
sleep 5;
Checkpoint globalRadio "RadioMsg12";


