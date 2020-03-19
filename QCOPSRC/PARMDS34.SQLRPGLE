       // exemple de DS contenant :
       //   - une ds avec parametres entrée
       //   - une ds avec parametres sortie

       // parametres en entrée (input)
       dcl-ds inDs_template qualified;
         a int(10) ;
         b int(10) ;
       end-ds;

       // parametres en sortie (output)
       dcl-ds ouDS_template qualified;
         c int(10);
       end-ds;

       // la ds passée en parametre
       dcl-ds parmDs_template qualified;
         //entrée
         inDs likeDs(inDs_template);
         //sortie
         ouDs likeDs(ouDs_template);
       end-ds;

       dcl-pr parmds4 extpgm('PARMDS4');
         parmDs likeDs(parmDs_template);
       end-pr;
 
