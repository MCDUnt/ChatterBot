
Unit u_maneja_archivo_peliculas;
{$CODEPAGE UTF8}

Interface

Uses entidad, CRT;

Procedure LEE_R(Var ARCH:T_ARCHIVO; POS:CARDINAL; Var R:t_dato);
Procedure GUARDA_R(Var ARCH:T_ARCHIVO; Var POS:CARDINAL; R:t_dato);
Procedure CARGA_R(Var r: t_dato);
Procedure LISTADO (Var ARCH:T_ARCHIVO);
Procedure ALTAS (Var ARCH:T_ARCHIVO);

Implementation

Procedure LEE_R(Var ARCH:T_ARCHIVO; POS:CARDINAL; Var R:t_dato);
//PARA MOSTRAR LOS VALORES
Begin
  SEEK(ARCH, POS);
  READ(ARCH, R);
End;

Procedure GUARDA_R(Var ARCH:T_ARCHIVO; Var POS:CARDINAL; R:t_dato);
//PARA GUARDAR LOS VALORES EN EL ARCHIVO
Begin
  SEEK(ARCH, POS);
  WRITE(ARCH, R);
End;

Procedure CARGA_R(Var r: t_dato);
//PARA LLENAR LOS REGISTROS
Begin


  GOTOXY(45,13);
  WRITELN('Título de la pelicula: ');
  GOTOXY(45,14);
  READLN (R.Titulo);
  R.Titulo := upcase(R.Titulo);


  GOTOXY(45,15);
  WRITELN('Genero de la pelicula: ');
  GOTOXY(45,16);
  READLN (R.Genero);
  R.Genero := upcase(R.Genero);


  GOTOXY(45,17);
  WRITELN('Año de lazamiento: ');
  GOTOXY(45,18);
  READLN (R.Anualidad);
  r.Anualidad := upcase(r.Anualidad);


  GOTOXY(45,19);
  WRITELN('Productor de la pelicula: ');
  GOTOXY(45,20);
  READLN (R.Productora);
  r.Productora := upcase(r.Productora);


  GOTOXY(45,21);
  WRITELN('Actor principal / Protagonista: ');
  GOTOXY(45,22);
  READLN (R.Actor_principal);
  r.Actor_principal := upcase(r.Actor_principal);

End;

Procedure ALTAS (Var ARCH:T_ARCHIVO);
//PARA INGRESAR VALORES, UTILIZA PROCEDURE CARGA_R Y PROCEDURE GUARDA_R

Var 
  R: t_dato;
  POS: CARDINAL;
  RESP: CHAR;
Begin
  CLRSCR;
  GOTOXY(45,10);
  WRITE('*******ALTAS******') ;
  GOTOXY(45,12);
  RESP := '1';
  While RESP <> '0' Do
    Begin
      CARGA_R(R);
      //PROCEDURE CARGA_R(VAR r: t_dato);
      POS := FILESIZE(ARCH);
      //HACE QUE POS SEA LA ULT POSICION DISPONIBLE
      GUARDA_R(ARCH, POS,R);
      //PROCEDURE GUARDA_R(VAR ARCH:T_ARCHIVO; var POS:CARDINAL; R:t_dato);
      clrscr;
      GOTOXY(55,25);
      WRITE('CONTINUA? PRESIONE 0 PARA SALIR: ') ;
      READLN (RESP);
    End;
End;

Procedure LISTADO (Var ARCH:T_ARCHIVO);

Var 
  R: t_dato;
  I: CARDINAL;
Begin
  CLRSCR;
  GOTOXY(45,10);
  WRITE('*******LISTADO******') ;
  For I:= 0 To FILESIZE(ARCH)-1 Do
    Begin
      LEE_R (ARCH,I,R);
      //SEEK(ARCH,POS); READ(ARCH, R);
      GOTOXY(45,13);
      WRITELN('Título de la pelicula: ', R.Titulo);
      GOTOXY(45,15);
      WRITELN('Genero de la pelicula: ', R.Genero);
      GOTOXY(45,17);
      WRITELN('Año del film: ', R.Anualidad);
      GOTOXY(45,19);
      WRITELN('Director del film: ', R.productora);
      GOTOXY(45,21);
      WRITELN('Actor principal / Protagonista: ', R.Actor_principal);
      READKEY;
      clrscr;
    End;
End;

End.
