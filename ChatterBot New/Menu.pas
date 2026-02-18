Unit menu;
{$codepage utf8}

Interface

{$unitpath ../utils/}

Uses crt, Validadores, unit2_chat, unit1_archivo, iniciar_archivo, sysutils;

Procedure menu_principal;

Implementation

Procedure menu_principal;

Var 
  f: TextFile;
  res, respuesta, peli, salidaFormateada, peliculasMostradas, franqTemp, ultimaPelicula, anioTemp: STRING;
  seguirPidiendo: Boolean;
  enc: Boolean;

Begin
  iniciarArchivo(f);
  clrscr;
  WriteLn;
  textcolor(green);
  SaludosInicio();

  // Inicializar contexto
  // contextoAnterior := ''; // Ya no se usa en versión simplificada
  peliculasMostradas := '';

  Repeat
    textcolor(white);
    Write ('>');
    readln(res);
    WriteLn;
    respuesta := lowercase(res);
    If (Length(respuesta) > 0) Then
      Begin
        // Manejar saludos primero
        If ContieneSaludo(respuesta) Then
          Begin
            textcolor(green);
            RespuestaSaludo();
          End
        // Manejar años específicos
        Else If ContieneAnio(respuesta) Then
          Begin
            ExtraerAnio(respuesta, anioTemp);
            obtenerPalabrasClave(f, respuesta, peli, enc);
            If enc And (Not peliculaYaMostrada(peliculasMostradas, peli)) Then
              Begin
                RespPositiva();
                WriteLn;
                textcolor(blue);
                formatearSalidaPeliculas(peli, salidaFormateada);
                WriteLn(salidaFormateada);
                agregarPeliculaMostrada(peliculasMostradas, peli);
                ultimaPelicula := peli;
              End
            Else
              Begin
                textcolor(green);
                WriteLn('No encontre peliculas del año ', anioTemp, '. Intenta con otro año o genero.');
              End;
          End
        // Validación normal para otros casos
        Else If (length(respuesta) < 4) Or (Not ContieneGenero(respuesta)) And (Not ContieneFranquicia(respuesta)) And (Not ContieneDirector(respuesta)) And (Not ContieneActor(respuesta)) And (Not ContieneEpoca(respuesta)) And (Not ContieneAleatorio(respuesta)) And (Not ContieneSecuela(respuesta)) And (Not ((Pos('otra', Trim(respuesta)) > 0) Or (Pos('otro', Trim(respuesta)) > 0) Or (Pos('mas', Trim(respuesta)) > 0) Or (Pos('más', Trim(respuesta)) > 0) Or (Pos('siguiente', Trim(respuesta)) > 0))) Then
          Begin
            textcolor(green);
            IngresoErroneo();
          End
        Else
          Begin
            If (Not ContienSalir(lowercase(respuesta))) Then
              Begin
                textcolor(green);
                
                // Verificar si pide película aleatoria
                If ContieneAleatorio(respuesta) Then
                  Begin
                    peliculaAleatoria(f, peli, enc);
                    If enc And (Not peliculaYaMostrada(peliculasMostradas, peli)) Then
                      Begin
                        RespPositiva();
                        WriteLn;
                        textcolor(blue);
                        formatearSalidaPeliculas(peli, salidaFormateada);
                        WriteLn(salidaFormateada);
                        agregarPeliculaMostrada(peliculasMostradas, peli);
                        ultimaPelicula := peli;
                        // Ya no se guarda contexto en versión simplificada
                      End
                    Else
                      RespNegativa();
                  End
                // Verificar si pide por franquicia
                Else If ContieneFranquicia(respuesta) Then
                  Begin
                    ExtraerFranquicia(respuesta, franqTemp);
                    buscarPorFranquicia(f, franqTemp, peli, enc);
                    If enc And (Not peliculaYaMostrada(peliculasMostradas, peli)) Then
                      Begin
                        RespPositiva();
                        WriteLn;
                        textcolor(blue);
                        formatearSalidaPeliculas(peli, salidaFormateada);
                        WriteLn(salidaFormateada);
                        agregarPeliculaMostrada(peliculasMostradas, peli);
                        ultimaPelicula := peli;
                        // Ya no se guarda contexto en versión simplificada
                      End
                    Else
                      RespNegativa();
                  End
                // Verificar si pregunta sobre el contexto anterior
                Else If (Pos('otra', Trim(respuesta)) > 0) Or (Pos('otro', Trim(respuesta)) > 0) Or 
                        (Pos('mas', Trim(respuesta)) > 0) Or (Pos('más', Trim(respuesta)) > 0) Then
                  Begin
                    // Bucle de películas aleatorias con While
                    seguirPidiendo := true;
                    
                    While seguirPidiendo Do
                      Begin
                        peliculaAleatoria(f, peli, enc);
                        If enc And (Not peliculaYaMostrada(peliculasMostradas, peli)) Then
                          Begin
                            RespPositiva();
                            WriteLn;
                            textcolor(blue);
                            formatearSalidaPeliculas(peli, salidaFormateada);
                            WriteLn(salidaFormateada);
                            agregarPeliculaMostrada(peliculasMostradas, peli);
                            ultimaPelicula := peli;
                            
                            // Preguntar si quiere otra
                            textcolor(green);
                            WriteLn('¿Quieres otra pelicula? (otra/mas/siguiente o escribe algo diferente)');
                            Write('>');
                            readln(res);
                            respuesta := lowercase(res);
                            
                            // Si no pide "otra", cambiar la condición
                            If (Pos('otra', Trim(respuesta)) = 0) And (Pos('otro', Trim(respuesta)) = 0) And 
                               (Pos('mas', Trim(respuesta)) = 0) And (Pos('más', Trim(respuesta)) = 0) Then
                              seguirPidiendo := false;
                          End
                        Else If enc And peliculaYaMostrada(peliculasMostradas, peli) Then
                          Begin
                            // La película ya fue mostrada, seguimos buscando
                            // No hacemos nada, el bucle continuará
                          End
                        Else
                          Begin
                            textcolor(green);
                            WriteLn('No encontre mas peliculas para mostrarte.');
                            seguirPidiendo := false;
                          End;
                      End;
                  End
                // Verificar si pide específicamente "siguiente"
                Else If (Pos('siguiente', Trim(respuesta)) > 0) Then
                  Begin
                    peliculaSiguiente(f, ultimaPelicula, peli, enc);
                    If enc And (Not peliculaYaMostrada(peliculasMostradas, peli)) Then
                      Begin
                        RespPositiva();
                        WriteLn;
                        textcolor(blue);
                        formatearSalidaPeliculas(peli, salidaFormateada);
                        WriteLn(salidaFormateada);
                        agregarPeliculaMostrada(peliculasMostradas, peli);
                        ultimaPelicula := peli;
                      End
                    Else
                      Begin
                        textcolor(green);
                        WriteLn('No encontre la siguiente pelicula.');
                      End;
                  End
                // Verificar si pide secuelas
                Else If ContieneSecuela(respuesta) Then
                  Begin
                    textcolor(green);
                    WriteLn('Esta saga tiene varias partes mas, te animo a buscarlas!');
                  End
                // alternativa sugerida (comentada):
                // Else If ContieneSecuela(respuesta) Then
                //   Begin
                //     { primero intentamos extraer el título igual que en la búsqueda
                //       normal para poder comparar en el archivo }
                //     obtenerPalabrasClave(f, respuesta, peli, enc);
                //     If enc Then
                //       Begin
                //         If TieneSecuelaEnArchivo(f, peli) Then
                //           Begin
                //             textcolor(green);
                //             WriteLn('Esta saga tiene varias partes mas, te animo a buscarlas!');
                //           End
                //         Else
                //           Begin
                //             textcolor(red);
                //             WriteLn('No encontré más partes para "', peli, '"');
                //           End;
                //       End
                //     Else
                //       Begin
                //         textcolor(red);
                //         WriteLn('No pude identificar la película de la que hablas.');
                //       End;
                //   End
                // Búsqueda normal
                Else
                  Begin
                    obtenerPalabrasClave(f, respuesta, peli, enc);
                    If enc And (Not peliculaYaMostrada(peliculasMostradas, peli)) Then
                      Begin
                        RespPositiva();
                        WriteLn;
                        textcolor(blue);
                        formatearSalidaPeliculas(peli, salidaFormateada);
                        WriteLn(salidaFormateada);
                        // Ya no se guarda contexto en versión simplificada
                        agregarPeliculaMostrada(peliculasMostradas, peli);
                        ultimaPelicula := peli;
                      End
                    Else
                      Begin
                        RespNegativa();
                        // contextoAnterior := ''; // Ya no se usa
                      End;
                  End;
              End;
          End;
      End;
  Until ContienSalir(lowercase(respuesta));
  textcolor(green);
  SaludosDespedida();
  cerrarArchivo(f);
End;

End.