
Unit unit2_chat;

Interface

{$unitpath ../utils}

Uses palabras_claves;

Procedure SaludosInicio();
Procedure SaludosDespedida();
Procedure IngresoErroneo();
Procedure RespPositiva();
Procedure RespNegativa();
Procedure RespNegativaFinal();

Implementation

Procedure SaludosInicio();

Var i: Integer;
Begin
  randomize;
  i := random(10) + 1;
  WriteLn('Hola, soy el bot del grupo 11 ');
  WriteLn(saludo[i]);
  WriteLn ('Por si no sabes que te gustaria prueba con: Dame una pelicula de Sci-Fi ...o de algun genero que te guste');
End;

Procedure SaludosDespedida();

Var i: Integer;
Begin
  randomize;
  i := random(10) + 1;
  WriteLn(saludosAdios[i]);
End;

Procedure IngresoErroneo();

Var i: integer;
Begin
  randomize;
  i := random(10) + 1;
  WriteLn(resp_ingreso_neg[i]);
End;

Procedure RespPositiva();

Var i: integer;
Begin
  randomize;
  i := random(10) + 1;
  WriteLn(resp_positivas[i]);
End;

Procedure RespNegativa();

Var i: integer;
Begin
  randomize;
  i := random(10) + 1;
  WriteLn(resp_negativas[i]);
End;

Procedure RespNegativaFinal();

Var i: integer;
Begin
  randomize;
  i := random(10) + 1;
  WriteLn(resp_neg_final[i]);
End;

End.