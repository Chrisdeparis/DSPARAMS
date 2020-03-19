**free
ctl-opt option(*srcstmt) dftactgrp(*No);

/copy AADOJO/qcopsrc,parmDscoDs

dcl-pi *n;
  // paremeter list = un seul élément
  parmDS likeDs(parmDs_template);
end-pi;

// constantes
dcl-c c_const1 const('World !!');
// variables de travail
dcl-s w_message char(50);

monitor;

  if %trim(parmDs.in_param1) = 'Hello';
    clear parmDs.ou_param2;
    clear w_message;
    parmDs.ou_param2 = %trim(parmDs.in_param1)
                       + ' '
                       + c_const1;
    w_message =   'parmDs2 - valeur du parametre 2 : '
              + %trim(parmDs.ou_param2);
    dsply (%trim(w_message));
  else;
    clear w_message;
    w_message = 'parmDs2 - valeur parametre 1 différente de Hello';
    dsply (%trim(w_message));
  endif;

on-error *all;

endmon;

*inlr = *on; 
