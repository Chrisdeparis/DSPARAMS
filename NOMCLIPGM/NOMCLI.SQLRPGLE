ctl-opt option(*srcstmt) dftactgrp(*No);

// ds spécifique au prog NOMCLI
/copy MILFORT/qcopsrc,parmCLIDS
// ds commune au prog NOMCLI et au progr PARMDSEXT
/copy MILFORT/qcopsrc,parmDSEXT

dcl-pi *n;
  // paremeter list = un seul élément
  parmDs likeDs(parmDs_template);
end-pi;

dcl-ds parmDs likeDs(parmDs_template);
//dcl-ds parmDs3 likeDs(parmDs3_template);

// variables de travail
dcl-s w_message char(50);
dcl-s w_numCli char(5);


dcl-s errCheckParm ind;

monitor;

  clear w_message;
  clear parmDs;

  exsr checkParm;
  if not errCheckParm;

    parmDs.inDs.numClient = w_numCli;
    

    parmDSEXT (parmDs);

    w_message = 'parmDs : numClient ('
              + %char(parmDs.inDs.numClient)
              + ') + et'
              + ' nomClient => ('
              + %char(parmDs.ouDs.nomClient)
              + ')';

    dsply (%trim(w_message));

  else;
    // erreur parametres
  endif;

on-error *all;

endmon;

*inlr = *on;