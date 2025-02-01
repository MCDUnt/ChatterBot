
Unit unit1_archivo;

Interface

Uses SysUtils;

Procedure ObtenerDatos(linea: String; Var titulo, autor, genero, actor, anio:
                       String);

Implementation

Procedure ObtenerDatos(linea: String; Var titulo, autor, genero, actor, anio:
                       String);

Var 
  partes: array[1..5] Of string;
  i, posInicio, posDelim: integer;
Begin
  posInicio := 1;

  // Extraer los 5 campos separados por '|'
  For i := 1 To 5 Do
    Begin
      posDelim := Pos('|', linea);
      If posDelim > 0 Then
        Begin
          partes[i] := Trim(Copy(linea, posInicio, posDelim - 1));
          // con trim le saco el espacio antes y despues al string
          // Para obtener el texto antes de '|' 
          Delete(linea, 1, posDelim);
          // Para eliminar la parte extraída y el delimitador
        End
      Else
        partes[i] := Trim(linea);
    End;

  titulo := partes[1];
  autor := partes[2];
  genero := partes[3];
  actor := partes[4];
  anio := partes[5];
End;
End.
