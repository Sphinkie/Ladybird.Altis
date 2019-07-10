// -------------------------------------------------------------------------
// Messages radio quand on croise les renforts
// -------------------------------------------------------------------------

sleep 9;
// "Dispatch à Alpha. Renforts blindés en approche de Pyrgos. Tenez bon, les gars.";
[BLUFOR, "AirBase"] commandRadio "RadioMsg1";

sleep 15;
// "Dispatch à Tous. Liberez la route de Pyrgos. Laissez passer le convoi prioritaire.";
[BLUFOR, "AirBase"] commandRadio "RadioMsg2";
