
Unit unit2_chat;

Interface

{$unitpath ../utils}

Uses palabras_claves;

Function SaludosInicio(): string;
Function SaludosDespedida(): string;

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

End.
