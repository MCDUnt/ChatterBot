unit procesos;
{$CODEPAGE UTF8}
interface
uses
  u_archivo_peliculas,u_maneja_archivo_peliculas,crt;


Procedure Buscar_titulo (var arch:t_archivo);
procedure buscar_genero(var arch:t_archivo);
procedure buscar_anualidad(var arch:t_archivo);
procedure buscar_actor(var arch:t_archivo);
procedure buscar_autor(var arch:t_archivo);
PROCEDURE HELP;
PROCEDURE HOLA;

implementation

Procedure Buscar_titulo (var arch:t_archivo);
var
titulo,respuesta:string;
r:t_dato;
   begin
      clrscr;
      gotoxy(60,15); writeln('Título: ');
      gotoxy(68,15); readln(titulo);
      seek(arch,0);
      read(arch,r);
      if r.Titulo = titulo then
          begin
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
          end
      else
            Writeln('No se encuentra, desea agregar los datos de la pelicula? Si/No ');
            readln(respuesta);
            respuesta:=upcase(respuesta);
              if respuesta = 'SI' then
                  begin
                    altas(arch);
                  end;

   end;

procedure buscar_genero(var arch:t_archivo);
var
genero,respuesta:string;
r:t_dato;
i,j:cardinal;
begin
      j:=0;
      clrscr;
      gotoxy(60,15); writeln('Género: ');
      gotoxy(68,15); readln(genero);
      genero:=upcase(genero);
       FOR I:= 0 TO FILESIZE(ARCH)-1 DO
       BEGIN
       LEE_R (ARCH,I,R);
        if r.Genero = genero then
            begin
              j:=j+1;
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
            end;
        end;
               if j = 0 then
                   begin
                     Writeln('No se encuentra ninguna pelicula de ese género, desea agregar alguna? Si/No ');
                     readln(respuesta);
                     respuesta:=upcase(respuesta);
                      if respuesta = 'SI' then
                          begin
                               altas(arch);
                          end;
                   end;
end;
procedure buscar_anualidad(var arch:t_archivo);
var
anualidad,respuesta:string;
r:t_dato;
i,j:cardinal;
begin
      j:=0;
      clrscr;
      gotoxy(60,15); writeln('Año: ');
      gotoxy(68,15); readln(anualidad);
      anualidad:=upcase(anualidad);
       FOR I:= 0 TO FILESIZE(ARCH)-1 DO
       BEGIN
       LEE_R (ARCH,I,R);
        if r.Anualidad = anualidad then
            begin
              j:=j+1;
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
            end;
        end;
               if j = 0 then
                   begin
                     Writeln('No se encuentra ninguna pelicula de ese año, desea agregar alguna? Si/No ');
                     readln(respuesta);
                     respuesta:=upcase(respuesta);
                      if respuesta = 'SI' then
                          begin
                               altas(arch);
                          end;
                   end;
end;

procedure buscar_autor(var arch:t_archivo);
var
autor,respuesta:string;
r:t_dato;
i,j:cardinal;
begin
      j:=0;
      clrscr;
      gotoxy(60,15); writeln('Autor/Productora: ');
      gotoxy(78,15); readln(autor);
      autor:=upcase(autor);
       FOR I:= 0 TO FILESIZE(ARCH)-1 DO
       BEGIN
       LEE_R (ARCH,I,R);
        if r.Productora = autor then
            begin
              j:=j+1;
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
            end;
        end;
               if j = 0 then
                   begin
                     Writeln('No se encuentra ninguna pelicula de esa productora, desea agregar alguna? Si/No ');
                     readln(respuesta);
                     respuesta:=upcase(respuesta);
                      if respuesta = 'SI' then
                          begin
                               altas(arch);
                          end;
                   end;
end;

procedure buscar_actor(var arch:t_archivo);
var
actor,respuesta:string;
r:t_dato;
i,j:cardinal;
begin
      j:=0;
      clrscr;
      gotoxy(60,15); writeln('Protagonista/Actor: ');
      gotoxy(68,15); readln(actor);
      actor:=upcase(actor);
       FOR I:= 0 TO FILESIZE(ARCH)-1 DO
       BEGIN
       LEE_R (ARCH,I,R);
        if r.Actor_principal = actor then
            begin
              j:=j+1;
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
            end;
        end;
               if j = 0 then
                   begin
                     Writeln('No se encuentra ninguna pelicula de este actor, desea agregar alguna? Si/No ');
                     readln(respuesta);
                     respuesta:=upcase(respuesta);
                      if respuesta = 'SI' then
                          begin
                               altas(arch);
                          end;
                   end;
end;

PROCEDURE HELP;
BEGIN
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
writeln('Evita las tildes y las Ñ, el programa no se lleva bien con ellas. ');
delay(2000);
writeln('Para salir del programa debes despedirte :)');
delay(5000);
end;

PROCEDURE HOLA;
var i:byte;
BEGIN
randomize;
i:=random(5);
case i of
1: writeln('Hola amiguito');
2: writeln('Buen dia/noche');
3: writeln('Hola Ingeniero');
4: writeln('El Lol apesta');
5: writeln('Aprobame Claudia :(');
end;
Readkey;
clrscr;
end;
end.

