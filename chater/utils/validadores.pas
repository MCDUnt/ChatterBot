
Unit validadores;

Interface

{$unitpath ./}

Uses sysutils, palabras_claves;

Function ContienSalir(cadena: String): Boolean;

Implementation

Function ContienSalir(cadena: String): Boolean;

Var 
  i: Integer;
Begin
  ContienSalir := false;
  While (i <= 13) And (Not ContienSalir) Do
    Begin
      If Pos(despedida[i], cadena) > 0 Then
        Begin
          ContienSalir := True;
        End;
      Inc(i);
    End;
End;


End.
