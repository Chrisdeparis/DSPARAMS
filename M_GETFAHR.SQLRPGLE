**free

  // Fonction qui prend une temp en Celsius
  //   retourne une temp en Fahrenheit
  // celsiusTemp = (fahrTemp - 32) * (5/9)
  // input    <-- [temperature en °C]
  // output   --> [temperature en °F]

ctl-opt nomain;


dcl-proc getFahrenheit export;

  dcl-pi *n  PACKED(5:0);
    inTempCels PACKED(5:2);
  end-pi;

  // variables

  dcl-s ouTempFahr    packed(5:0);
  //dcl-s tempFahr packed(5:0);

  monitor;

  ouTempFahr = 0;

  //tempFahr = %dec(inTempFahr:5:0);

  ouTempFahr = ( inTempCels * (9/5) ) + 32;

  on-error *all;
  endmon;

  return ouTempFahr;


end-proc; 
