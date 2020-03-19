**free
// formation sur les DS
// prog parmds3 reçoit en paramétre une DS
// contenant les variables a et b
// définies en caractére.
//
// si les variables a et b sont correctement renseignées
//   alors on passe ces 2 variables numériques en parametre
//   au programme de somme parmds4
//   le programme va effectuer :  variable c = somme (a, b)
//   la variable c est présente dans la ds parametre partagée par les
//   2 programmes.
//   le programme appelant parmds3 va récupérer le résultat dans la ds
//   et affiche ce résultat.
// sinon
//   affichage : parametres invalides
// finSi
//                                        -a--b-
// appel correct :     call parmds3 parm('001004')
// appel avec parm a à blanc : call parmds3 parm('   004')
// appel avec parm b à blanc : call parmds3 parm('004   ')
//

ctl-opt option(*srcstmt) dftactgrp(*No);

// ds spécifique au prog parmDs3
/copy AADOJO/qcopsrc,parmDs3
// ds commune au prog parmds3 et au progr parmds4
/copy AADOJO/qcopsrc,parmDs34

dcl-pi *n;
  // paremeter list = un seul élément
  parmDS3 likeDs(parmDs3_template);
end-pi;

dcl-ds parmDs likeDs(parmDs_template);
//dcl-ds parmDs3 likeDs(parmDs3_template);

// variables de travail
dcl-s w_message char(50);
dcl-s w_aNum packed(3:0);
dcl-s w_bNum packed(3:0);

dcl-s errCheckParm ind;

monitor;

  clear w_message;
  clear parmDs;

  exsr checkParm;
  if not errCheckParm;

    parmDs.inDs.a = w_aNum;
    parmDs.inDs.b = w_bNum;

    parmDS4 (parmDs);

    w_message = 'parmDs3 : a ('
              + %char(parmDs.inDs.a)
              + ') + b ('
              + %char(parmDs.inDs.b)
              + ') = c ('
              + %char(parmDs.ouDs.c)
              + ')';

    dsply (%trim(w_message));

  else;
    // erreur parametres
  endif;

on-error *all;

endmon;

*inlr = *on;

//-----------------------------------------------------------------------------
begsr checkParm;

  errCheckParm = *off;

  // controle valeur de a
  if parmDs3.aChar <> *blanks;
    monitor;
      w_aNum = 0;
      w_aNum = %dec(parmDs3.aChar:3:0);
      // controle valeur de b
      if parmDs3.bChar <> *blanks;
        monitor;
          w_bNum = 0;
          w_bNum = %dec(parmDs3.bChar:3:0);
        on-error *all; // b non numérique
          errCheckParm = *on;
        endmon;
      else; // b = blanc
        errCheckParm = *on;
      endif;
    on-error *all; // a non numérique
      errCheckParm = *on;
    endmon;
  else; // a = blanc
    errCheckParm = *on;
  endif;

  if errCheckParm;
    dsply ('le parametre a ou le parametre b est invalide');
  endif;

endsr; 
