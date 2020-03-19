**free
         // Fonction qui prend un couple dupli/appli
         //   retourne si il faut lancer ou pas le traitement de dupli
         // input    <-- [temperature en °F]
         // output   --> [status]

ctl-opt nomain;

dcl-proc getStatusFahrenheit export;

  dcl-pi *n char(10);
   inTempFahr PACKED(5:0);
  end-pi;

  // Déclaration des Constantes
  dcl-c c_zeroFahr  const(32);
  dcl-c c_centFahr  const(212);

  // variables
  dcl-s ouStatus char(10);  // valeurs=[degel, gel]

  select;
     when inTempFahr < c_zeroFahr;
       ouStatus = 'solid';
     when inTempFahr = c_zeroFahr;
       ouStatus = 'freezing';
     when inTempFahr = c_centFahr;
       ouStatus = 'boiling';
     when inTempFahr > c_centFahr;
       ouStatus = 'gaseous';
     other;
       ouStatus = 'liquid';
  endsl;

  return ouStatus;

 end-proc;









 
