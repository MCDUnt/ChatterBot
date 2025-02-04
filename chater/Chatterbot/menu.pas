
Unit menu;
{$codepage utf8}

Interface

{$unitpath ../utils/}

Uses crt, validadores, unit2_chat, unit1_archivo, iniciar_archivo;

Procedure menu_principal;

Implementation

Procedure menu_principal;

Var 
  f: TextFile;
  respuesta, peli: STRING;
  enc: Boolean;
Begin
  iniciarArchivo(f);
  clrscr;
  WriteLn;
  textcolor(green);
  SaludosInicio();
  Repeat
    textcolor(white);
    WriteLn;
    readln(respuesta);
    WriteLn;
    If (Length(respuesta) > 0) Then
      Begin
        If (length(respuesta) < 4) Then
          Begin
            textcolor(green);
            IngresoErroneo();
          End
        Else
          Begin
            If (Not ContienSalir(lowercase(respuesta))) Then
              Begin
                textcolor(green);
                obtenerPalabrasClave(f, respuesta, peli, enc);
                If (enc) Then
                  Begin
                    RespPositiva();
                    textcolor(blue);
                    WriteLn(peli);
                  End
                Else
                  Begin
                    RespNegativa();
                    // RespNegativaFinal();
                    // textcolor(yellow);
                    // writeln(peli);
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
