**free

ctl-opt option(*srcstmt) dftactgrp(*No) bnddir('LINK');

dcl-pi *n;
  intempCel char(3);
end-pi;

//** Définition des procédures
dcl-pr celsToFahr Extproc('CELSTOFAHR');
  in_tempCel    packed(5:2);
  ou_tempFahr packed(5:0);
  ou_status      char(10);
end-pr;

dcl-s wtempFahr    packed(5:0);
dcl-s wtempCelsius packed(5:2);
dcl-s wstatus      char(10);
dcl-s message      char(50);

monitor;

  wtempFahr    = 0;
  wtempcelsius = 0;
  wstatus      = *blanks;
  
  wtempCelsius = %dec(inTempCel:5:2);

  // appel
  celsToFahr (wtempCelsius
             :wtempFahr
             :wstatus);
  // le but afficher les °C en °F
  message =    'At '+ %char(wtempCelsius)
             + ' °C ('
             + %Char(wtempFahr)
             + ' °F), water is '
             + %trim(wstatus)
             + '.';

  dsply (message);

on-error *all;
  dsply ('valeur parametre temperature incorrecte');
endmon;

*inlr = *on; 
