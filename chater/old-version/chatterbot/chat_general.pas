unit chat_general;
{$codepage utf8}
interface
uses
  crt,chat;
Procedure genero;
procedure SEGUN_RESPUESTA(var x:string);
implementation


  Procedure genero;
  Var
    Respuesta:string;
  Begin
    Write('Escriba el género que desea, si quiere saber todos los géneros ingrese "lista de géneros".');
    Readln(respuesta);
    If (upcase(respuesta)='PELICULAS ACTUALES') then
      peliculas_actuales;
  end;

  Procedure actor;
  Var
    Respuesta:string;
  Begin
    Write('Perfecto, dime que actor te gustaria. Tambien puedo mostrarte la lista de actores de mi base de datos con "lista de actores".');
    Readln(respuesta);
    respuesta:=upcase(respuesta);
    If (respuesta = 'LISTA DE ACTORES') OR (respuesta = 'ACTORES')  then
      begin
       //lista_de_actores;
      end
  end;

  procedure SEGUN_RESPUESTA(var x:string);
  begin
    x:=upcase(x);

    if x = 'GENERO' then
      begin
       genero;
      end
    else
      if x = 'AUTOR' then
        begin

        end
    else
     if x = 'ACTOR' then
        begin

        end
     else
  end;
end.

