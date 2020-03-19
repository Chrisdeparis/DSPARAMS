**free


ctl-opt nomain;

dcl-proc celsToFahr export;

dcl-pi *n;
  in_tempCel    packed(5:2);
  ou_tempFahr    packed(5:0);
  ou_status      char(10);
end-pi;

dcl-pr getFahrenheit packed(5:0) Extproc('GETFAHRENHEIT');
  inCelTemp     packed(5:2);
end-pr;

dcl-pr getStatusFahrenheit char(10) Extproc('GETSTATUSFAHRENHEIT');
  inFahrTemp  packed(5:0);
end-pr;

dcl-s celsTemp   packed(5:2);

// Main Routine
monitor;

  celsTemp = %dec(in_tempCel:5:2);

  ou_tempFahr = 0;
  ou_status      = *blanks;


  // appel calcul de conversion celsius -> fahrenheit

  ou_tempFahr = getFahrenheit(celsTemp);

  // appel proc qui fournit le statut (gel, degel)
  ou_status = getStatusFahrenheit(ou_tempFahr);

on-error *all;
  dsply ('valeur parametre temperature incorrecte');
endmon;

end-proc; 
