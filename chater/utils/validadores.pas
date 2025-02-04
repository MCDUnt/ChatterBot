
Unit validadores;

Interface

{$unitpath ./}

Uses sysutils, palabras_claves;

Function ContienSalir(cadena: String): Boolean;
Function ContieneGenero(cadena: String): Boolean;
Function ContieneDirector(cadena: String): Boolean;
Function ContieneActor(cadena: String): Boolean;
Function ContieneEpoca(cadena: String): Boolean;
Procedure BuscarGenero(cadena: String; Var gen: String);
Procedure BuscarEpoca(cadena: String; Var ep: String);

Implementation

Function ContienSalir(cadena: String): Boolean;

Var 
  i: Integer;
Begin
  ContienSalir := false;
  i := 1;
  While (i <= 13) And (Not ContienSalir) Do
    Begin
      If Pos(despedida[i], cadena) > 0 Then
        Begin
          ContienSalir := True;
        End;
      Inc(i);
    End;
End;

Function ContieneGenero(cadena: String): Boolean;

Var 
  i: Integer;
Begin
  ContieneGenero := false;
  i := 1;
  While (i <= 23) And (Not ContieneGenero) Do
    Begin
      If Pos(genero[i], cadena) > 0 Then
        Begin
          ContieneGenero := True;
        End;
      Inc(i);
    End;
End;

Procedure BuscarGenero(cadena: String; Var gen: String);

Var 
  i: Integer;
  enc: Boolean;
Begin
  gen := '';
  i := 1;
  enc := false;
  While (i <= 23) And (Not enc) Do
    Begin
      If Pos(genero[i], cadena) > 0 Then
        Begin
          gen := genero[i];
          enc := True;
        End;
      Inc(i);
    End;
End;

Function ContieneDirector(cadena: String): Boolean;

Var 
  i: Integer;
Begin
  ContieneDirector := false;
  i := 1;
  While (i <= 2) And (Not ContieneDirector) Do
    Begin
      If Pos(director[i], cadena) > 0 Then
        Begin
          ContieneDirector := True;
        End;
      Inc(i);
    End;
End;

Function ContieneActor(cadena: String): Boolean;

Var 
  i: Integer;
Begin
  ContieneActor := false;
  i := 1;
  While (i <= 2) And (Not ContieneActor) Do
    Begin
      If Pos(actor[i], cadena) > 0 Then
        Begin
          ContieneActor := True;
        End;
      Inc(i);
    End;
End;

Function ContieneEpoca(cadena: String): Boolean;

Var 
  i: Integer;
Begin
  ContieneEpoca := false;
  i := 1;
  While (i <= 11) And (Not ContieneEpoca) Do
    Begin
      If Pos(epoca[i], cadena) > 0 Then
        Begin
          ContieneEpoca := True;
        End;
      Inc(i);
    End;
End;

Procedure BuscarEpoca(cadena: String; Var ep: String);

Var 
  i: Integer;
  enc: Boolean;
Begin
  ep := '';
  i := 1;
  enc := false;
  While (i <= 23) And (Not enc) Do
    Begin
      If Pos(epoca[i], cadena) > 0 Then
        Begin
          ep := epoca[i];
          enc := True;
        End;
      Inc(i);
    End;
End;


End.
