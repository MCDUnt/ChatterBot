
Unit u_archivo_peliculas;
{$CODEPAGE UTF8}

Interface

Uses entidad;

Var arch: T_archivo;

Procedure CREAR(Var ARCH:T_ARCHIVO);
Procedure ABRIR(Var ARCH:T_ARCHIVO);
Procedure CERRAR(Var ARCH:T_ARCHIVO);

Implementation

Procedure CREAR(Var ARCH:T_ARCHIVO);
Begin
  ASSIGN(ARCH,RUTA);
  REWRITE(ARCH);
End;
Procedure ABRIR(Var ARCH:T_ARCHIVO);
Begin
  ASSIGN(ARCH,RUTA);
  RESET(ARCH);
End;

Procedure CERRAR(Var ARCH:T_ARCHIVO);
Begin
  CLOSE(ARCH);
End;
End.
