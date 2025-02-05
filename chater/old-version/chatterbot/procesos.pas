
Unit procesos;
{$CODEPAGE UTF8}

Interface

Uses 
u_archivo_peliculas,u_maneja_archivo_peliculas,crt, entidad;
Procedure Buscar_titulo (Var arch:t_archivo);
Procedure buscar_genero(Var arch:t_archivo);
Procedure buscar_anualidad(Var arch:t_archivo);
Procedure buscar_actor(Var arch:t_archivo);
Procedure buscar_autor(Var arch:t_archivo);
Procedure HELP;
Procedure HOLA;

Implementation

Procedure Buscar_titulo (Var arch:t_archivo);

Var 
  titulo,respuesta: string;
  r: t_dato;
Begin
  clrscr;
  gotoxy(60,15);
  writeln('Título: ');
  gotoxy(68,15);
  readln(titulo);
  seek(arch,0);
  read(arch,r);
  If r.Titulo = titulo Then
    Begin
      GOTOXY(45,13);
      WRITELN('Título de la pelicula: ', R.Titulo);
      GOTOXY(45,15);
      WRITELN('Genero de la pelicula: ', R.Genero);
      GOTOXY(45,17);
      WRITELN('Año del film: ', R.Anualidad);
      GOTOXY(45,19);
      WRITELN('Productora del film: ', R.Productora);
      GOTOXY(45,21);
      WRITELN('Actor principal / Protagonista: ', R.Actor_principal);
      READKEY;
      clrscr;
    End
  Else
    Writeln('No se encuentra, desea agregar los datos de la pelicula? Si/No ');
  readln(respuesta);
  respuesta := upcase(respuesta);
  If respuesta = 'SI' Then
    Begin
      altas(arch);
    End;

End;

Procedure buscar_genero(Var arch:t_archivo);

Var 
  genero,respuesta: string;
  r: t_dato;
  i,j: cardinal;
Begin
  j := 0;
  clrscr;
  gotoxy(60,15);
  writeln('Género: ');
  gotoxy(68,15);
  readln(genero);
  genero := upcase(genero);
  For I:= 0 To FILESIZE(ARCH)-1 Do
    Begin
      LEE_R (ARCH,I,R);
      If r.Genero = genero Then
        Begin
          j := j+1;
          GOTOXY(45,13);
          WRITELN('Título de la pelicula: ', R.Titulo);
          GOTOXY(45,15);
          WRITELN('Genero de la pelicula: ', R.Genero);
          GOTOXY(45,17);
          WRITELN('Año del film: ', R.Anualidad);
          GOTOXY(45,19);
          WRITELN('Productora del film: ', R.Productora);
          GOTOXY(45,21);
          WRITELN('Actor principal / Protagonista: ', R.Actor_principal);
          READKEY;
          clrscr;
        End;
    End;
  If j = 0 Then
    Begin
      Writeln(
 'No se encuentra ninguna pelicula de ese género, desea agregar alguna? Si/No '
      );
      readln(respuesta);
      respuesta := upcase(respuesta);
      If respuesta = 'SI' Then
        Begin
          altas(arch);
        End;
    End;
End;
Procedure buscar_anualidad(Var arch:t_archivo);

Var 
  anualidad,respuesta: string;
  r: t_dato;
  i,j: cardinal;
Begin
  j := 0;
  clrscr;
  gotoxy(60,15);
  writeln('Año: ');
  gotoxy(68,15);
  readln(anualidad);
  anualidad := upcase(anualidad);
  For I:= 0 To FILESIZE(ARCH)-1 Do
    Begin
      LEE_R (ARCH,I,R);
      If r.Anualidad = anualidad Then
        Begin
          j := j+1;
          GOTOXY(45,13);
          WRITELN('Título de la pelicula: ', R.Titulo);
          GOTOXY(45,15);
          WRITELN('Genero de la pelicula: ', R.Genero);
          GOTOXY(45,17);
          WRITELN('Año de lanzamiento: ', R.Anualidad);
          GOTOXY(45,19);
          WRITELN('Productor de la pelicula: ', R.Productora);
          GOTOXY(45,21);
          WRITELN('Actor principal / Protagonista: ', R.Actor_principal);
          READKEY;
          clrscr;
        End;
    End;
  If j = 0 Then
    Begin
      Writeln(
    'No se encuentra ninguna pelicula de ese año, desea agregar alguna? Si/No '
      );
      readln(respuesta);
      respuesta := upcase(respuesta);
      If respuesta = 'SI' Then
        Begin
          altas(arch);
        End;
    End;
End;

Procedure buscar_autor(Var arch:t_archivo);

Var 
  autor,respuesta: string;
  r: t_dato;
  i,j: cardinal;
Begin
  j := 0;
  clrscr;
  gotoxy(60,15);
  writeln('Autor/Productora: ');
  gotoxy(78,15);
  readln(autor);
  autor := upcase(autor);
  For I:= 0 To FILESIZE(ARCH)-1 Do
    Begin
      LEE_R (ARCH,I,R);
      If r.Productora = autor Then
        Begin
          j := j+1;
          GOTOXY(45,13);
          WRITELN('Título de la pelicula: ', R.Titulo);
          GOTOXY(45,15);
          WRITELN('Genero de la pelicula: ', R.Genero);
          GOTOXY(45,17);
          WRITELN('Año del film: ', R.Anualidad);
          GOTOXY(45,19);
          WRITELN('Productora del film: ', R.Productora);
          GOTOXY(45,21);
          WRITELN('Actor principal / Protagonista: ', R.Actor_principal);
          READKEY;
          clrscr;
        End;
    End;
  If j = 0 Then
    Begin
      Writeln(
'No se encuentra ninguna pelicula de esa productora, desea agregar alguna? Si/No '
      );
      readln(respuesta);
      respuesta := upcase(respuesta);
      If respuesta = 'SI' Then
        Begin
          altas(arch);
        End;
    End;
End;

Procedure buscar_actor(Var arch:t_archivo);

Var 
  actor,respuesta: string;
  r: t_dato;
  i,j: cardinal;
Begin
  j := 0;
  clrscr;
  gotoxy(60,15);
  writeln('Protagonista/Actor: ');
  gotoxy(68,15);
  readln(actor);
  actor := upcase(actor);
  For I:= 0 To FILESIZE(ARCH)-1 Do
    Begin
      LEE_R (ARCH,I,R);
      If r.Actor_principal = actor Then
        Begin
          j := j+1;
          GOTOXY(45,13);
          WRITELN('Título de la pelicula: ', R.Titulo);
          GOTOXY(45,15);
          WRITELN('Genero de la pelicula: ', R.Genero);
          GOTOXY(45,17);
          WRITELN('Año del film: ', R.Anualidad);
          GOTOXY(45,19);
          WRITELN('Productora del film: ', R.Productora);
          GOTOXY(45,21);
          WRITELN('Actor principal / Protagonista: ', R.Actor_principal);
          READKEY;
          clrscr;
        End;
    End;
  If j = 0 Then
    Begin
      Writeln(
  'No se encuentra ninguna pelicula de este actor, desea agregar alguna? Si/No '
      );
      readln(respuesta);
      respuesta := upcase(respuesta);
      If respuesta = 'SI' Then
        Begin
          altas(arch);
        End;
    End;
End;

Procedure HELP;
Begin
  clrscr;
  Writeln('Ok aqui va un pequeño tutorial ;) ');
  Writeln('Presiona cualquier tecla para continuar. ');
  readkey;
  clrscr;
  Writeln('Las palabras claves para buscar tu pelicula son:  ');
  delay(2000);
  Writeln('Titulo ');
  delay(2000);
  Writeln('Genero ');
  delay(2000);
  Writeln('Epoca(año) ');
  delay(2000);
  Writeln('Actor');
  delay(2000);
  Writeln('Autor:  ');
  delay(2000);
  Writeln('Presiona cualquier tecla para continuar.... ');
  readkey;
  clrscr;
  writeln('Evita las tildes y las Ñ, el programa no se lleva bien con ellas. ')
  ;
  delay(2000);
  writeln('Para salir del programa debes despedirte :)');
  delay(5000);
End;

Procedure HOLA;

Var i: byte;
Begin
  randomize;
  i := random(5);
  Case i Of 
    1: writeln('Hola amiguito');
    2: writeln('Buen dia/noche');
    3: writeln('Hola Ingeniero');
    4: writeln('El Lol apesta');
    5: writeln('Aprobame Claudia :(');
  End;
  Readkey;
  clrscr;
End;
End.
