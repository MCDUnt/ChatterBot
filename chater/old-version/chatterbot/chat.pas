unit chat;
{$codepage utf8}
interface
uses crt;
Procedure peliculas_actuales;
implementation
  Procedure peliculas_actuales;
  Begin
  Case random(3) of
      0:Writeln('Casa blanca.');
      1:Writeln('El rey leon.');
      2:Writeln('Scarface.');
    end;
    readkey;
  end;
end.

