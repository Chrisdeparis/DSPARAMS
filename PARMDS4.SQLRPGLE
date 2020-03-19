**free
ctl-opt option(*srcstmt) dftactgrp(*No);

/copy AADOJO/qcopsrc,parmDs34

dcl-pi *n;
  // paremeter list = un seul élément
  parmDS likeDs(parmDs_template);
end-pi;

// variables de travail
dcl-s w_message char(50);

monitor;

  clear parmDs.ouDs.c;
  parmDs.ouDs.c =   parmDs.inDs.a
                  + parmDs.inDs.b;

on-error *all;

endmon;

*inlr = *on; 
