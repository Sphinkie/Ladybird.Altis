// --------------------------------------------------------------
// Arrival on Landing Zone
// --------------------------------------------------------------
// hint "TrgLandingZone"; 

// Task is done
call FNC_taskLandingzone_Done;

// Dialogue (globalchat pour etre entendu de loin)
sleep 12;
correspondant setRandomLip true; 
correspondant globalChat "Hey! Americans! Come here!";
correspondant say "corres01";
correspondant setRandomLip false;


//hint "Airplane1 removed from Airbase"
deleteVehicle airplane1;