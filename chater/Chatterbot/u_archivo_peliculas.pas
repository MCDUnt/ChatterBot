UNIT u_archivo_peliculas;
{$CODEPAGE UTF8}
INTERFACE
CONST
RUTA= 'C:\Archivos\PELICULAS.DAT';
TYPE

T_DATO = record
         Titulo:string[20];
         Genero:string[20];
         Anualidad:string[20];
         Productora:string[20];
         Actor_principal:string[20];
         end;

T_ARCHIVO = FILE OF T_DATO;

VAR arch:T_archivo;

PROCEDURE CREAR(VAR ARCH:T_ARCHIVO);
PROCEDURE ABRIR(VAR ARCH:T_ARCHIVO);
PROCEDURE CERRAR(VAR ARCH:T_ARCHIVO);

IMPLEMENTATION

    PROCEDURE CREAR(VAR ARCH:T_ARCHIVO);
    BEGIN
        ASSIGN(ARCH,RUTA);
        REWRITE(ARCH);
    END;
    PROCEDURE ABRIR(VAR ARCH:T_ARCHIVO);
    BEGIN
        ASSIGN(ARCH,RUTA);
        RESET(ARCH);
    END;

    PROCEDURE CERRAR(VAR ARCH:T_ARCHIVO);
    BEGIN
        CLOSE(ARCH);
    END;
end.
