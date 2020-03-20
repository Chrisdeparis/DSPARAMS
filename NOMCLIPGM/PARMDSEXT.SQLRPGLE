**free
ctl-opt option(*srcstmt) dftactgrp(*No);

/copy AADOJO/qcopsrc,parmCLIDS

dcl-pi *n;
  // paremeter list = un seul élément
  parmDS likeDs(parmDs_template);
end-pi;

// variables de travail
dcl-s w_message char(50);

monitor;

  clear parmDs.ouDs.nomClient;
  parmDs.ouDs.nomClient =   parmDs.inDs.numClient;
                  

on-error *all;

endmon;

*inlr = *on; 
