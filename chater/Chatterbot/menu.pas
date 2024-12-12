
Unit menu;
{$codepage utf8}

Interface

Uses 
crt,u_archivo_peliculas,procesos, iniciar_archivo;

Procedure menu_principal;

Implementation

Procedure menu_principal;

Var 
  respuesta_string: STRING;

Begin
  iniciarArchivo();

  Gotoxy(25,10);
  Writeln(
'HOOOLAAAAA, soy el bot programado por el grupo 4 utilizado para recomendar peliculas.'
  );
  Gotoxy(25,12);
  Writeln(
'Te puedo recomendar películas por género, por autor, por actor, por época y péliculas al azar.'
  );
  respuesta_string := ('NADA');
  readkey;
  While (upcase(respuesta_string) <> 'ADIOS') And (upcase(respuesta_string) <>
        'CHAU') And (upcase(respuesta_string) <> 'NOS VEMOS') Do
    Begin
      clrscr;
      Gotoxy(5,14);
      writeln('Qué estas buscando de la pelicula?');
      Gotoxy(64,1);
      writeln(
'No dudes en usar el comando HELP si necesitas un tutorial del el funcionamiento'
      );
      Gotoxy(5,16);
      readln(respuesta_string);
      respuesta_string := upcase(respuesta_string);

      If (respuesta_string = 'TITULO') Or (respuesta_string = 'TÍTULO') Then
        Begin
          buscar_titulo(arch);
        End;
      If (respuesta_string = 'GENERO') Or (respuesta_string = 'GÉNERO')Then
        Begin
          buscar_genero(arch);
        End;
      If (respuesta_string = 'AÑO') Or (respuesta_string = 'EPOCA') Or (
         respuesta_string = 'ÉPOCA')Then
        Begin
          buscar_anualidad(arch);
        End;
      If (respuesta_string = 'PRODUCTORA') Or (respuesta_string = 'AUTOR') Then
        Begin
          buscar_autor(arch);
        End;
      If (respuesta_string = 'ACTOR') Or (respuesta_string = 'PROTAGONISTA')
        Then
        Begin
          buscar_actor(arch);
        End;
      If (respuesta_string = 'HELP') Or (respuesta_string = 'AYUDA') Then
        Begin
          HELP;
        End;
      If (respuesta_string = 'HOLA') Or (respuesta_string = 'HOLAA') Or (
         respuesta_string = 'HOLIS') Then
        Begin
          HOLA;
        End;
    End;
  writeln('NOOOSSSS VEMOSSS :) ');
  DELAY(2000);
End;

End.
