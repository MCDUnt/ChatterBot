
Unit iniciar_archivo;

Interface

Uses entidad;

Procedure iniciarArchivo();
Procedure cerrarArchivo(Var arch: T_ARCHIVO);

Implementation

Procedure iniciarArchivo();

Var 
  arch: T_ARCHIVO;
Begin
  Assign(arch, RUTA);
  //Para chequear se puede utilizar las directivas al compilador:
 {$I-}
  //orden al compilador que deshabilite el control de IO
  Reset(arch);
{$I+}
  //orden al compilador que habilite el control de IO
  If IOResult<>0 Then Rewrite(arch); {si no existe lo crea}
End;

Procedure cerrarArchivo(Var arch: T_ARCHIVO);
Begin
  Close(arch);
End;

End.
