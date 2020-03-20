**free
ctl-opt option(*srcstmt) dftactgrp(*No);

/copy MILFORT/qcopsrc,parmCLIDS

dcl-pi *n;
  // paremeter list = un seul élément
  parmDS likeDs(parmDs_template);
end-pi;

// variables de travail
dcl-s w_message char(50);

monitor;

  clear parmDs.ouDs.nomClient;
  if parmDS.ouDS.returnCode = 0;
    // faire le lien entre le param numClient => nomClient
    parmDs.ouDs.nomClient =   parmDs.inDs.numClient;
  else;

  endif;
  

                  

on-error *all;

endmon;

*inlr = *on; 
