
Unit entidad;

Interface

Const 
  RUTA = '../archivos/peliculas.DAT';

Type 

  T_DATO = Record
    Titulo: string[20];
    Genero: string[20];
    Anualidad: string[20];
    Productora: string[20];
    Actor_principal: string[20];
  End;

  T_ARCHIVO = FILE Of T_DATO;

Implementation

End.
