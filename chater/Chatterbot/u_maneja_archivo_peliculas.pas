UNIT u_maneja_archivo_peliculas;
{$CODEPAGE UTF8}
INTERFACE

USES u_archivo_peliculas, CRT;

PROCEDURE LEE_R(VAR ARCH:T_ARCHIVO; POS:CARDINAL; VAR R:t_dato);
PROCEDURE GUARDA_R(VAR ARCH:T_ARCHIVO; var POS:CARDINAL; R:t_dato);
PROCEDURE CARGA_R(VAR r: t_dato);
PROCEDURE LISTADO (VAR ARCH:T_ARCHIVO);
PROCEDURE ALTAS (VAR ARCH:T_ARCHIVO);

IMPLEMENTATION

PROCEDURE LEE_R(VAR ARCH:T_ARCHIVO; POS:CARDINAL; VAR R:t_dato);  //PARA MOSTRAR LOS VALORES
BEGIN
    SEEK(ARCH, POS);
    READ(ARCH, R);
END;

PROCEDURE GUARDA_R(VAR ARCH:T_ARCHIVO; var POS:CARDINAL; R:t_dato);   //PARA GUARDAR LOS VALORES EN EL ARCHIVO
BEGIN
    SEEK(ARCH, POS);
    WRITE(ARCH, R);
END;

PROCEDURE CARGA_R(VAR r: t_dato);                              //PARA LLENAR LOS REGISTROS
begin


    GOTOXY(45,13); WRITELN('Título de la pelicula: ');
    GOTOXY(45,14); READLN (R.Titulo);
    R.Titulo:=upcase(R.Titulo);


    GOTOXY(45,15); WRITELN('Genero de la pelicula: ');
    GOTOXY(45,16); READLN (R.Genero);
    R.Genero:=upcase(R.Genero);


    GOTOXY(45,17); WRITELN('Año de lazamiento: ');
    GOTOXY(45,18); READLN (R.Anualidad);
    r.Anualidad:=upcase(r.Anualidad);


    GOTOXY(45,19); WRITELN('Productor de la pelicula: ');
    GOTOXY(45,20); READLN (R.Productora);
    r.Productora:=upcase(r.Productora);


    GOTOXY(45,21); WRITELN('Actor principal / Protagonista: ');
    GOTOXY(45,22); READLN (R.Actor_principal);
    r.Actor_principal:=upcase(r.Actor_principal);

end;

PROCEDURE ALTAS (VAR ARCH:T_ARCHIVO);                           //PARA INGRESAR VALORES, UTILIZA PROCEDURE CARGA_R Y PROCEDURE GUARDA_R
VAR
R:t_dato;
POS:CARDINAL;
RESP:CHAR;
BEGIN
    CLRSCR;
    GOTOXY(45,10);
    WRITE('*******ALTAS******') ;
    GOTOXY(45,12);
    RESP:='1';
    WHILE RESP <> '0' DO
        BEGIN
            CARGA_R(R);                                             //PROCEDURE CARGA_R(VAR r: t_dato);
            POS:=FILESIZE(ARCH);                                    //HACE QUE POS SEA LA ULT POSICION DISPONIBLE
            GUARDA_R(ARCH, POS,R);                                  //PROCEDURE GUARDA_R(VAR ARCH:T_ARCHIVO; var POS:CARDINAL; R:t_dato);
            clrscr;
            GOTOXY(55,25);
            WRITE('CONTINUA? PRESIONE 0 PARA SALIR: ') ;
            READLN (RESP);
        END;
END;

PROCEDURE LISTADO (VAR ARCH:T_ARCHIVO);
VAR
R:t_dato;
I:CARDINAL;
BEGIN
    CLRSCR;
    GOTOXY(45,10);
    WRITE('*******LISTADO******') ;
    FOR I:= 0 TO FILESIZE(ARCH)-1 DO
        BEGIN
            LEE_R (ARCH,I,R);                                      //SEEK(ARCH,POS); READ(ARCH, R);
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
        END;
    END;

END.
