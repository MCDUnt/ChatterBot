
Unit menu;
{$codepage utf8}

Interface

{$unitpath ../utils/}

Uses crt, validadores, unit2_chat;

Procedure menu_principal;

Implementation

Procedure menu_principal;

Var 
  respuesta: STRING;

Begin
  // iniciarArchivo();
  clrscr;
  WriteLn;
  textcolor(green);
  SaludosInicio();
  WriteLn;
  textcolor(white);
  ReadLn(respuesta);
  WriteLn;
  If (Length(respuesta) > 0) Then
    Begin
      If (Not ContienSalir(lowercase(respuesta))) Then
        writeln('No esta la palabra salir')
      Else
        Begin
          textcolor(green);
          SaludosDespedida();
        End;
    End;
End;

End.
