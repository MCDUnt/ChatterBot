Unit validadores;

Interface

{$unitpath ./}

Uses sysutils, palabras_claves;

Function ContienSalir(cadena: String): Boolean;
Function ContieneSaludo(cadena: String): Boolean;
Procedure RespuestaSaludo;
Function ContieneAnio(cadena: String): Boolean;
Procedure ExtraerAnio(cadena: String; Var anio: String);
Function ContieneGenero(cadena: String): Boolean;
Function ContieneDirector(cadena: String): Boolean;
Function ContieneActor(cadena: String): Boolean;
Function ContieneEpoca(cadena: String): Boolean;
Function ContieneAleatorio(cadena: String): Boolean;
Function ContieneSecuela(cadena: String): Boolean;
Function ContieneFranquicia(cadena: String): Boolean;
Procedure BuscarGenero(cadena: String; Var gen: String);
Procedure BuscarEpoca(cadena: String; Var ep: String);
Procedure ExtraerFranquicia(cadena: String; Var franq: String);

Implementation

// *** snippets opcionales de refactorización (comentadas para decidir usar o no) ***
// const
//   clavesSecuela: array[1..6] of string = (
//     'secuela','secuelas','continuacion','otra parte','otras partes','segunda'
//   );
//   // se podrían agregar otras listas (géneros, franquicias, etc.) aquí
//
// function ContieneClave(const claves: array of String; const cadena: String): Boolean;
// var
//   i: Integer;
//   lc: String;
// begin
//   lc := LowerCase(cadena);
//   ContieneClave := False;
//   i := Low(claves);
//   While (i <= High(claves)) And (Not ContieneClave) Do
//     Begin
//       If Pos(claves[i], lc) > 0 Then
//         Begin
//           ContieneClave := True;
//         End;
//       Inc(i);
//     End;
// end;
//
// function TieneSecuelaEnArchivo(var f: TextFile; const tituloBase: String): Boolean;
// var
//   linea, titulo: String;
//   contador: Integer;
// begin
//   contador := 0;
//   Reset(f);
//   While Not EOF(f) Do
//     Begin
//       ReadLn(f, linea);
//       // suponiendo que el título ocupa el primer campo antes de ';'
//       titulo := Trim(Copy(linea, 1, Pos(';', linea) - 1));
//       If AnsiCompareText(titulo, tituloBase) = 0 Then
//         Inc(contador);
//     End;
//   Close(f);
//   TieneSecuelaEnArchivo := contador > 1;
// end;
//============== NO LO LLEGUE A TERMINAR ===============

Function ContienSalir(cadena: String): Boolean;

Var 
  i: Integer;
Begin
  ContienSalir := false;
  i := 1;
  While (i <= 12) And (Not ContienSalir) Do
    Begin
      If Pos(despedida[i], cadena) > 0 Then
        Begin
          ContienSalir := True;
        End;
      Inc(i);
    End;
End;

Function ContieneSaludo(cadena: String): Boolean;

Var 
  i: Integer;
Begin
  ContieneSaludo := false;
  i := 1;
  While (i <= 6) And (Not ContieneSaludo) Do
    Begin
      If Pos(saludo[i], cadena) > 0 Then
        Begin
          ContieneSaludo := True;
        End;
      Inc(i);
    End;
End;

Procedure RespuestaSaludo;

Var 
  i: Integer;
Begin
  i := Random(10) + 1;
  WriteLn(saludos_respuesta[i]);
  WriteLn('Por si no sabes que te gustaria prueba con: Dame una pelicula de Sci-Fi ...o de algun genero que te guste');
End;

Function ContieneAnio(cadena: String): Boolean;

Var 
  i: Integer;
  anioStr: String;
  encontrado: Boolean;
Begin
  ContieneAnio := false;
  encontrado := false;
  
  // Buscar patrones de 4 dígitos (más eficiente)
  i := 1;
  While (i <= Length(cadena) - 3) And (Not encontrado) Do
    Begin
      // Si encontramos 4 dígitos seguidos
      If (cadena[i] >= '0') And (cadena[i] <= '9') And
         (cadena[i+1] >= '0') And (cadena[i+1] <= '9') And
         (cadena[i+2] >= '0') And (cadena[i+2] <= '9') And
         (cadena[i+3] >= '0') And (cadena[i+3] <= '9') Then
        Begin
          anioStr := Copy(cadena, i, 4);
          // Verificar que sea un año razonable (1900-2030)
          If (StrToInt(anioStr) >= 1900) And (StrToInt(anioStr) <= 2030) Then
            Begin
              ContieneAnio := True;
              encontrado := True;
            End;
        End;
      Inc(i);
    End;
End;

Procedure ExtraerAnio(cadena: String; Var anio: String);

Var 
  i: Integer;
  anioStr: String;
  encontrado: Boolean;
Begin
  anio := '';
  encontrado := false;
  
  // Buscar patrones de 4 dígitos (más eficiente)
  i := 1;
  While (i <= Length(cadena) - 3) And (Not encontrado) Do
    Begin
      // Si encontramos 4 dígitos seguidos
      If (cadena[i] >= '0') And (cadena[i] <= '9') And
         (cadena[i+1] >= '0') And (cadena[i+1] <= '9') And
         (cadena[i+2] >= '0') And (cadena[i+2] <= '9') And
         (cadena[i+3] >= '0') And (cadena[i+3] <= '9') Then
        Begin
          anioStr := Copy(cadena, i, 4);
          // Verificar que sea un año razonable (1900-2030)
          If (StrToInt(anioStr) >= 1900) And (StrToInt(anioStr) <= 2030) Then
            Begin
              anio := anioStr;
              encontrado := True;
            End;
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
  While (i <= 24) And (Not ContieneGenero) Do
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
  While (i <= 24) And (Not enc) Do
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
  While (i <= 6) And (Not ContieneDirector) Do
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
  While (i <= 18) And (Not ContieneEpoca) Do
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
  While (i <= 18) And (Not enc) Do
    Begin
      If Pos(epoca[i], cadena) > 0 Then
        Begin
          ep := epoca[i];
          enc := True;
        End;
      Inc(i);
    End;
End;

Function ContieneAleatorio(cadena: String): Boolean;

Var 
  palabras: array[1..5] Of string;
  i: Integer;
Begin
  palabras[1] := 'cualquiera';
  palabras[2] := 'aleatoria';
  palabras[3] := 'sorprendeme';
  palabras[4] := 'sorpréndeme';
  palabras[5] := 'recomienda';
  
  ContieneAleatorio := false;
  i := 1;
  While (i <= 5) And (Not ContieneAleatorio) Do
    Begin
      If Pos(palabras[i], cadena) > 0 Then
        Begin
          ContieneAleatorio := True;
        End;
      Inc(i);
    End;
End;

Function ContieneSecuela(cadena: String): Boolean;

Var 
  palabras: array[1..7] Of string;
  i: Integer;
Begin
  palabras[1] := 'secuela';
  palabras[2] := 'secuelas';
  palabras[3] := 'continuacion';
  palabras[4] := 'continuacion';
  palabras[5] := 'otra parte';
  palabras[6] := 'otras partes';
  palabras[7] := 'segunda';
  
  ContieneSecuela := false;
  i := 1;
  While (i <= 7) And (Not ContieneSecuela) Do
    Begin
      If Pos(palabras[i], cadena) > 0 Then
        Begin
          ContieneSecuela := True;
        End;
      Inc(i);
    End;
End;

Function ContieneFranquicia(cadena: String): Boolean;

Var 
  i: Integer;
Begin
  ContieneFranquicia := false;
  i := 1;
  While (i <= 27) And (Not ContieneFranquicia) Do
    Begin
      If Pos(franquicia[i], cadena) > 0 Then
        Begin
          ContieneFranquicia := True;
        End;
      Inc(i);
    End;
End;

Procedure ExtraerFranquicia(cadena: String; Var franq: String);

Var 
  i: Integer;
  enc: Boolean;
Begin
  franq := '';
  i := 1;
  enc := false;
  While (i <= 27) And (Not enc) Do
    Begin
      If Pos(franquicia[i], cadena) > 0 Then
        Begin
          franq := franquicia[i];
          enc := True;
        End;
      Inc(i);
    End;
End;

End.