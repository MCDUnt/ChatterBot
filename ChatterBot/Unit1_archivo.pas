
Unit unit1_archivo;

Interface
Uses sysUtils, validadores;

Procedure obtenerPalabrasClave(Var f: TextFile; cadena: String; Var pelicula:

                               String; Var enc: Boolean);

Procedure peliculaAleatoria(Var f: TextFile; Var pelicula: String; Var enc: Boolean);

Procedure formatearSalidaPeliculas(peliculas: String; Var salida: String);

Procedure agregarPeliculaMostrada(Var peliculasMostradas: String; pelicula: String);

Function peliculaYaMostrada(peliculasMostradas: String; pelicula: String): Boolean;

Procedure buscarPorFranquicia(Var f: TextFile; franq: String; Var pelicula: String; Var enc: Boolean);

// devuelve la película que sigue a `peliculaActual` en el archivo, si existe
Procedure peliculaSiguiente(Var f: TextFile; peliculaActual: String; Var pelicula: String; Var enc: Boolean);



Implementation



Procedure ObtenerDatos(linea: String; Var titulo, autor, genero, actor, anio:

                       String; Var franquicia: String);



Var 

  partes: array[1..6] Of string;

  i, posInicio, posDelim: integer;

Begin

  posInicio := 1;



  // Extraer los 6 campos separados por '|'

  For i := 1 To 6 Do

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

  franquicia := partes[6];

End;



Procedure BuscarEnArchivo(Var f: TextFile; cadena,clave: String; Var resp:

                          String);







// Busca dentro del archivo un actor, director o año, dependiendo del valor de clave.



Var 

  linea, titulo, autor, genero, actor, actor1, actor2, anio, franquicia: string;

  coma: integer;

  enc: Boolean;

Begin

  enc := false;

  reset(f);

  resp := '';

  While (Not Eof(f)) And (Not enc) Do

    Begin

      ReadLn(f, linea);

      ObtenerDatos(linea, titulo, autor, genero, actor, anio, franquicia);

      Case clave Of 

        'direc':

                 Begin

                   If pos(lowercase(autor), cadena) > 0 Then

                     Begin

                       resp := lowercase(autor);

                       enc := true;

                     End;

                 End;

        'actor':

                 Begin

                   coma := pos(',', actor);

                   If ( coma > 0) Then

                     Begin

                       actor1 := lowercase(Trim(Copy(actor, 1, coma - 1)));

                       actor2 := lowercase(Trim(Copy(actor, coma + 1, Length(

                                 actor) -

                                 coma)));

                       If pos(actor1, cadena) > 0 Then

                         Begin

                           resp := actor1;

                           enc := True;

                         End

                       Else If pos(actor2, cadena) > 0 Then

                              Begin

                                resp := actor2;

                                enc := True;

                              End;

                     End

                   Else If pos(lowercase(actor), cadena) > 0 Then

                          Begin

                            resp := lowercase(actor);

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



Procedure buscarPeliculas(Var f: TextFile; gen, act, an, direc: String;

                          Var pel: String; Var cant: Integer);



Var

  linea, titulo, autor, genero, actor, actor1, actor2, anio, franquicia: string;

  coma: Integer;

  cumple: Boolean;

Begin

  pel := '';

  cant := 0;

  Reset(f);



  While Not Eof(f) And (cant < 1) Do

    Begin

      ReadLn(f, linea);

      ObtenerDatos(linea, titulo, autor, genero, actor, anio, franquicia);

      cumple := False;



      // Genero

      If (Length(gen) > 0) And (Pos(gen, LowerCase(genero)) > 0) Then

        cumple := True;



      // Actor

      If (Not cumple) And (Length(act) > 0) Then

        Begin

          coma := Pos(',', actor);

          If coma > 0 Then

            Begin

              actor1 := LowerCase(Trim(Copy(actor, 1, coma - 1)));

              actor2 := LowerCase(Trim(Copy(actor, coma + 1, Length(actor) - coma)));

              If (actor1 = act) Or (actor2 = act) Then

                cumple := True;

            End

          Else If LowerCase(actor) = act Then

            cumple := True;

        End;



      // Director

      If (Not cumple) And (Length(direc) > 0) And

         (LowerCase(autor) = direc) Then

        cumple := True;



      // Año / Epoca

      If (Not cumple) And (Length(an) > 0) And (Pos(an, anio) > 0) Then

        cumple := True;





      If cumple Then

        Begin

          pel := pel + linea + #13#10;

          Inc(cant);

        End;

    End;

End;



// En deficitiva si por ejemplo gen esta contenido en los generos → devuelve la linea completa



Procedure obtenerPalabrasClave(Var f: TextFile; cadena: String; Var pelicula:

                               String; Var enc: Boolean);



Var 

  gen, actor, direc, anio: string; cant:Integer;

Begin

  gen := '';

  actor := '';

  direc := '';

  anio := '';

  If ContieneGenero(cadena) Then

    BuscarGenero(cadena, gen);

  If ContieneDirector(cadena) Then

    Begin

      If Pos('dirigidas por', cadena) > 0 Then

        direc := Trim(Copy(cadena, Pos('dirigidas por', cadena) + 12, Length(cadena)))

      Else If Pos('dirigida por', cadena) > 0 Then

        direc := Trim(Copy(cadena, Pos('dirigida por', cadena) + 11, Length(cadena)));

    End;

  If ContieneEpoca(cadena) Then

    BuscarEnArchivo(f, cadena, 'anio', anio);

  BuscarEnArchivo(f, cadena, 'actor', actor);



  buscarPeliculas(f, gen, actor, anio, direc, pelicula, cant);

  enc := cant > 0;

End;



Procedure peliculaAleatoria(Var f: TextFile; Var pelicula: String; Var enc: Boolean);



Var 

  linea: string;

  totalLineas, lineaAleatoria, i: integer;

Begin

  pelicula := '';

  enc := false;

  totalLineas := 0;

  

  // Contar lineas totales

  Reset(f);

  While Not Eof(f) Do

    Begin

      ReadLn(f, linea);

      Inc(totalLineas);

    End;

  

  If totalLineas > 0 Then

    Begin

      Randomize;

      lineaAleatoria := Random(totalLineas) + 1;

      

      Reset(f);

      For i := 1 To lineaAleatoria Do

        ReadLn(f, linea);

      

      pelicula := linea;

      enc := true;

    End;

End;



Procedure formatearSalidaPeliculas(peliculas: String; Var salida: String);



Var 

  linea, titulo, autor, genero, actor, anio, franquicia: string;

  posSalto: integer;

  temp: string;

Begin

  salida := '';

  temp := peliculas;

  

  While Length(temp) > 0 Do

    Begin

      posSalto := Pos(#13#10, temp);

      If posSalto > 0 Then

        Begin

          linea := Copy(temp, 1, posSalto - 1);

          Delete(temp, 1, posSalto + 1);

        End

      Else

        Begin

          linea := temp;

          temp := '';

        End;

      

      If Length(linea) > 0 Then

        Begin

          ObtenerDatos(linea, titulo, autor, genero, actor, anio, franquicia);

          salida := salida + '- Titulo: ' + titulo + #13#10;

          salida := salida + '  Director: ' + autor + #13#10;

          salida := salida + '  Genero: ' + genero + #13#10;

          salida := salida + '  Actores: ' + actor + #13#10;

          salida := salida + '  Anio: ' + anio;

        End;

    End;

End;



Procedure agregarPeliculaMostrada(Var peliculasMostradas: String; pelicula: String);



Var 

  titulo, autor, genero, actor, anio, franquicia: string;

  peliculaKey: string;

Begin

  ObtenerDatos(pelicula, titulo, autor, genero, actor, anio, franquicia);

  peliculaKey := titulo + '|' + anio; // Usamos título y año como clave única

  

  If Length(peliculasMostradas) > 0 Then

    peliculasMostradas := peliculasMostradas + ',' + peliculaKey

  Else

    peliculasMostradas := peliculaKey;

End;



Function peliculaYaMostrada(peliculasMostradas: String; pelicula: String): Boolean;



Var 

  titulo, autor, genero, actor, anio, franquicia: string;

  peliculaKey: string;

Begin

  ObtenerDatos(pelicula, titulo, autor, genero, actor, anio, franquicia);

  peliculaKey := titulo + '|' + anio + '|' + franquicia;

  

  peliculaYaMostrada := Pos(peliculaKey, peliculasMostradas) > 0;

End;



Procedure buscarPorFranquicia(Var f: TextFile; franq: String; Var pelicula: String; Var enc: Boolean);



Var 

  linea, titulo, autor, genero, actor, anio, franquicia: string;

Begin

  pelicula := '';

  enc := false;

  Reset(f);

  

  While Not Eof(f) And (Not enc) Do

    Begin

      ReadLn(f, linea);

      ObtenerDatos(linea, titulo, autor, genero, actor, anio, franquicia);

      

      If Pos(lowercase(franq), lowercase(franquicia)) > 0 Then

        Begin

          pelicula := linea;

          enc := true;

        End;

    End;

End;


// devuelve la siguiente película después de `peliculaActual`
Procedure peliculaSiguiente(Var f: TextFile; peliculaActual: String; Var pelicula: String; Var enc: Boolean);

Var 

  lineaActual: String;

  encontrada: Boolean;

Begin

  pelicula := '';

  enc := false;

  encontrada := false;

  

  Reset(f);

  While Not Eof(f) Do

    Begin

      ReadLn(f, lineaActual);

      

      If encontrada Then

        Begin

          pelicula := lineaActual;

          enc := true;
          
          encontrada := false; // Salir apenas encontramos la siguiente

        End;

      

      If lineaActual = peliculaActual Then

        encontrada := true;

    End;

End;


End.

