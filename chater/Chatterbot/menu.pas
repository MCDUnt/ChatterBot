unit menu;
{$codepage utf8}
interface
uses
  crt,u_archivo_peliculas,procesos;

Procedure menu_principal;

implementation

Procedure menu_principal;
Var
   respuesta_string:STRING;

Begin
abrir(arch);

Gotoxy(25,10); Writeln('HOOOLAAAAA, soy el bot programado por el grupo 4 utilizado para recomendar peliculas.');
Gotoxy(25,12); Writeln('Te puedo recomendar películas por género, por autor, por actor, por época y péliculas al azar.');
respuesta_string:=('NADA');
readkey;
WHILE (upcase(respuesta_string) <> 'ADIOS') AND (upcase(respuesta_string) <> 'CHAU') AND (upcase(respuesta_string) <> 'NOS VEMOS') DO
    begin
      clrscr;
      Gotoxy(5,14); writeln('Qué estas buscando de la pelicula?');
      Gotoxy(64,1); writeln('No dudes en usar el comando HELP si necesitas un tutorial del el funcionamiento');
      Gotoxy(5,16); readln(respuesta_string);
                    respuesta_string:=upcase(respuesta_string);

                    if (respuesta_string = 'TITULO') OR (respuesta_string = 'TÍTULO') then
                    begin
                       buscar_titulo(arch);
                    end;
                    if (respuesta_string = 'GENERO') OR (respuesta_string = 'GÉNERO')then
                    begin
                       buscar_genero(arch);
                    end;
                    if (respuesta_string = 'AÑO') OR (respuesta_string = 'EPOCA') OR (respuesta_string = 'ÉPOCA')then
                    begin
                      buscar_anualidad(arch);
                    end;
                    if (respuesta_string = 'PRODUCTORA') OR (respuesta_string = 'AUTOR') then
                    begin
                      buscar_autor(arch);
                    end;
                    if (respuesta_string = 'ACTOR') OR (respuesta_string = 'PROTAGONISTA') then
                    begin
                      buscar_actor(arch);
                    end;
                    if (respuesta_string = 'HELP') OR (respuesta_string = 'AYUDA') then
                    begin
                      HELP;
                    end;
                    if (respuesta_string = 'HOLA') OR (respuesta_string = 'HOLAA') OR (respuesta_string = 'HOLIS') then
                    begin
                      HOLA;
                    end;
      end;
        writeln('NOOOSSSS VEMOSSS :) ');
        DELAY(2000);
end;

end.

