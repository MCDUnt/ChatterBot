
Unit unit2_chat;

Interface

{$unitpath ../utils}

Uses palabras_claves;

Function SaludosInicio(): string;
Function SaludosDespedida(): string;
Function IngresoErroneo(): string;
Function RespPositiva(): string;
Function RespNegativa(): string;
Function RespNegativaFinal(): string;

Implementation

Function SaludosInicio(): string;

Var i: Integer;
Begin
  randomize;
  i := random(10);
  WriteLn('Hola, soy el bot del grupo 4 ', saludo[i]);
End;

Function SaludosDespedida(): string;

Var i: Integer;
Begin
  randomize;
  i := random(10);
  WriteLn(saludosAdios[i]);
End;

Function IngresoErroneo(): string;

Var i: integer;
Begin
  randomize;
  i := random(10);
  WriteLn(resp_ingreso_neg[i]);
End;

Function RespPositiva(): string;

Var i: integer;
Begin
  randomize;
  i := random(10);
  WriteLn(resp_positivas[i]);
End;

Function RespNegativa(): string;

Var i: integer;
Begin
  randomize;
  i := random(10);
  WriteLn(resp_negativas[i]);
End;

Function RespNegativaFinal(): string;

Var i: integer;
Begin
  randomize;
  i := random(10);
  WriteLn(resp_neg_final[i]);
End;

End.
