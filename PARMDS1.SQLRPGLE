**free
ctl-opt option(*srcstmt) dftactgrp(*No);

/copy AADOJO/qcopsrc,parmDscoDs

dcl-pr parmds2 extpgm('PARMDS2');
  parmDs likeDs(parmDs_template);
end-pr;

dcl-pi *n;
  // paremeter list = un seul élément
  parmDS likeDs(parmDs_template);
end-pi;

// variables de travail
dcl-s w_message char(50);

monitor;

  w_message = 'parmDs1 - valeur du parametre 1 : '
            + %trim(parmDs.in_param1);
  dsply (%trim(w_message));

  clear parmDs.ou_param2;
  parmDS2 (parmDs);

on-error *all;

endmon;

*inlr = *on; 
