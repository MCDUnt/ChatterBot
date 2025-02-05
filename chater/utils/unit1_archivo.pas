
Unit unit1_archivo;

Interface

Uses SysUtils, validadores;

Procedure obtenerPalabrasClave(Var f: TextFile; cadena: String; Var pelicula:
                               String; Var enc: Boolean);

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

Procedure BuscarEnArchivo(Var f: TextFile; cadena,clave: String; Var resp:
                          String);

Var 
  linea, titulo, autor, genero, actor, actor1, actor2, anio: string;
  enc: Boolean;
Begin
  enc := false;
  reset(f);
  While (Not Eof(f)) And (Not enc) Do
    Begin
      ReadLn(f, linea);
      ObtenerDatos(linea, titulo, autor, genero, actor, anio);
      Case clave Of 
        'direc':
                 Begin
                   If pos(autor, cadena) > 0 Then
                     Begin
                       resp := autor;
                       enc := true;
                     End;
                 End;
        'actor':
                 Begin
                   coma := pos(',', actor);
                   If ( coma > 0) Then
                     Begin
                       actor1 := Trim(Copy(cadena, 1, coma - 1));
                       actor2 := Trim(Copy(cadena, coma + 1, Length(cadena) -
                                 coma));
                       If pos(actor1, cadena) Then
                         Begin
                           resp := actor1;
                           enc := True;
                         End
                       Else If pos(actor2, cadena) Then
                              Begin
                                resp := actor2;
                                enc := True;
                              End;
                     End
                   Else If pos(actor, cadena) > 0 Then
                          Begin
                            resp := actor;
                            enc := true;
                          End;
                 End;
        'anio':
                Begin
                  If pos(anio, cadena) > 0 Then
                    Begin
                      resp := anio;
                      enc := true;
                    End;
                End;
      End;
    End;
End;

Procedure buscarPelicula(Var f: TextFile; gen, act, an, direc: String; Var
                         pel: String; Var enc: Boolean);

Var flag: Boolean;
  linea, titulo, autor, genero, actor, anio: string;
Begin
  enc := false;
  reset(f);
  While Not (Eof(f)) And (Not enc) Do
    Begin
      ReadLn(f, linea);
      ObtenerDatos(linea, titulo, autor, genero, actor, anio);
      If (length(gen) > 0) And (gen = genero) Then
        Begin
          enc := True;
          pel := linea;
        End
      Else If (Length(act) > 0) And (autor = act) Then
             Begin
               enc := True;
               pel := linea;
             End
      Else If (length(direc) > 0) And (direc = autor) Then
             Begin
               enc := True;
               pel := linea;
             End
      Else If (Length(an) > 0) And (an = anio) Then
             Begin
               enc := True;
               pel := linea;
             End
    End;
  // writeln('aca 4');
  // If (Not enc) And (Length(act) > 0) Then
  //   Begin
  //     writeln('aca 5');
  //     // reset(f);
  //     flag := false;
  //     While Not (eof) And (Not flag) Do
  //       Begin
  //         ReadLn(f, linea);
  //         ObtenerDatos(linea, titulo, autor, genero, actor, anio);
  //         If (actor = act) Then
  //           Begin
  //             flag := true;
  //             pel := linea;
  //           End;
  //       End;
  //   End
  // Else If (Not enc) And (Length(gen) > 0) Then
  //        Begin
  //          writeln('aca 5');
  //          //  reset(f);
  //          flag := false;
  //          While Not (eof) And (Not flag) Do
  //            Begin
  //              ReadLn(f, linea);
  //              ObtenerDatos(linea, titulo, autor, genero, actor, anio);
  //              If (gen = genero) Then
  //                Begin
  //                  flag := true;
  //                  pel := linea;
  //                End;
  //            End;
  //        End
  // Else If (Not enc) And (Length(an) > 0) Then
  //        Begin
  //          writeln('aca 6');
  //          //  reset(f);
  //          flag := false;
  //          While Not (eof) And (Not flag) Do
  //            Begin
  //              ReadLn(f, linea);
  //              ObtenerDatos(linea, titulo, autor, genero, actor, anio);
  //              If (an = anio) Then
  //                Begin
  //                  flag := true;
  //                  pel := linea;
  //                End;
  //            End;
  //        End;

End;

Procedure obtenerPalabrasClave(Var f: TextFile; cadena: String; Var pelicula:
                               String; Var enc: Boolean);

Var 
  gen, actor, direc, anio: string;
Begin
  If ContieneGenero(cadena) Then
    BuscarGenero(cadena, gen);
  If ContieneDirector(cadena) Then
    BuscarEnArchivo(f, cadena, 'direc', direc);
  If ContieneEpoca(cadena) Then
    BuscarEnArchivo(f, cadena, 'anio', anio);
  BuscarEnArchivo(f, cadena, 'actor', actor);

  buscarPelicula(f, gen, actor, anio, direc, pelicula, enc);

End;
End.
