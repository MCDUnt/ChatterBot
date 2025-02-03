
Unit palabras_claves;

Interface

Const 
  genero: array[1..23] Of string = ('drama', 'comedia', 'accion', 'aventura',
                                    'sci-fi', 'misterio', 'crimen', 'thriller',
                                    'fantasia', 'romance', 'historia',
                                    'animacion', 'horror', 'biografia',
                                    'musical', 'deporte', 'guerra', 'familiar',
                                    'documental', 'western', 'musica',
                                    'suspenso', 'filosofico');

  epoca: array[1..11] Of string = ('epoca', 'año', 'anio', 'años', 'anios',
                                   '60', '70', '80', '90', 'clasicos',
                                   'recientes');

  actor: array[1..2] Of string = ('me gusta', 'soy fan de');

  director: array[1..2] Of string = ('dirigidas por', 'dirigida por');

  despedida: array[1..13] Of string = ('adios', 'hasta luego', 'nos vemos',
                                       'cuidate', 'hasta pronto',
                                       'que tengas un buen dia',
                                       'hasta la proxima', 'saludos',
                                       'despedida', 'buenas noches',
                                       'hasta mañana', 'chao', 'chau');

  saludo: array[1..10] Of string = (
                 'Bienvenido a nuestro servicio de recomendaciones de peliculas'
                                    ,
                     'Estoy aqui para ayudarte a encontrar la pelicula perfecta'
                                    ,'Listo para descubrir nuevas peliculas?',
                      'Te ayudare a encontrar la pelicula ideal para esta noche'
                                    ,
                                    'Vamos a explorar el mundo del cine juntos?'
                                    ,'Preparado para una maraton de peliculas?',
                                   'Dime tus preferencias y te recomendare algo'
                                    ,
                           'Empezamos con algunas recomendaciones de peliculas?'
                                    ,
                                   'Encantado de ayudarte a elegir una pelicula'
                                    ,
                            'Listo para descubrir tu proxima pelicula favorita?'
                                   );

  resp_positivas: array[1..10] Of string = ('Genial, encontre lo que buscabas',
                                          'Perfecto, aqui tienes lo que pediste'
                                            ,
                                     'Excelente, esto es justo lo que necesitas'
                                            ,
                                       'Fantastico, encontre una opcion para ti'
                                            ,
                                  'Maravilloso, esto es lo que estabas buscando'
                                            ,'Increible, aqui esta tu resultado'
                                            ,
                                            'Estupendo, encontre lo que querias'
                                            , 'Super, esto es lo que necesitas',
                                           'Magnifico, aqui tienes tu resultado'
                                            , 'Bravo, encontre lo que pediste');

  resp_negativas: array[1..10] Of string = (
                                          'Lo siento, no encontre coincidencias'
                                            ,
                            'Lamentablemente, no pude encontrar lo que buscabas'
                                            ,
                               'No hay resultados que coincidan con tu busqueda'
                                            ,
                   'No encontre ninguna opcion que se ajuste a tus preferencias'
                                            ,
                        'Lo siento, no pude encontrar una pelicula que coincida'
                                            , 'no hay coincidencias disponibles'
                                            ,
                                      'No encontre resultados para tu solicitud'
                                            ,
                                  'Lamentablemente, no hay opciones disponibles'
                                            ,
                  'No pude encontrar una pelicula que se ajuste a lo que buscas'
                                            ,
                               'Lo siento, no hay coincidencias en este momento'
                                           );

  resp_neg_final: array[1..10] Of string = ('pero puedo recomendarte esto',
                                            '¿que te parece ver esta otra?',
                                       'pero tengo una excelente opcion para ti'
                                            ,
                                          'pero tengo algo que te podria gustar'
                                            , 'pero puedo sugerirte esta',
                                            'pero aqui va una recomendacion',
                                           'pero seguro disfrutaras esta opcion'
                                            ,
                                            'pero puedo ofrecerte algo similar',
                                 'pero tengo una recomendacion que te encantara'
                                            ,
                               'pero que tal esta otra que tambien es excelente'
                                           );

  resp_ingreso_neg: array[1..10] Of string = (
                                        'Parece que hubo un error en tu mensaje'
                                              ,
                                       'Lo siento, no entendi lo que ingresaste'
                                              ,
                           'Por favor, verifica tu mensaje e intenta nuevamente'
                                              ,
                               'No pude procesar tu solicitud, intenta de nuevo'
                                              ,
                'Parece que hubo un problema con tu mensaje, por favor revisalo'
                                              ,
                          'No reconozco ese mensaje, intenta con algo diferente'
                                              ,
                                   'Hubo un error, por favor intenta nuevamente'
                                              ,
                               'No pude entender tu solicitud, intenta de nuevo'
                                              ,
                     'Parece que ingresaste algo incorrecto, por favor revisalo'
                                              ,
                                       'Lo siento, no pude procesar ese mensaje'
                                             );

  saludosAdios: array[1..10] Of string = ('Adios', 'Hasta luego', 'Nos vemos',
                                          'Cuidate', 'Chao', 'Hasta pronto',
                                          'Que estes bien', 'Hasta la proxima'
                                          , 'Bye', 'Saludos');

Implementation

End.
