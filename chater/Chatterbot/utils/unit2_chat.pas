
Unit unit2_chat;

Interface

{$unitpath ./}

Uses palabras_clave;

Function SaludosDespedida(): string;

Implementation

Function SaludosDespedida(): string;

Var i: Integer;
Begin
  randomize;
  i := random(10);
  WriteLn(saludosAdios[i]);
End;

End.
