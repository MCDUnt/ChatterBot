Unit palabras_claves;

Interface

Const 
  genero: array[1..24] Of string = ('drama', 'comedia', 'accion', 'aventura',
                                    'sci-fi', 'misterio', 'crimen', 'thriller',
                                    'fantasia', 'romance', 'historia',
                                    'animacion', 'horror', 'biografia',
                                    'musical', 'deporte', 'guerra', 'familiar',
                                    'documental', 'western', 'musica',
                                    'suspenso', 'filosofico', 'ghibli');

  franquicia: array[1..27] Of string = ('marvel', 'batman', 'terminator', 'lotr', 'hobbit',
                                      'harry_potter', 'harry poter', 'harry_poter', 'jurassic', 'autos', 'john_wick',
                                      'joker', 'dreamworks', 'pixar', 'ghibli',
                                      'star_wars', 'mission_impossible', 'alien', 'scream',
                                      'saw', 'conjuring_universe', 'anime', 'coreano', 'thriller_clasico', 'musical', 'otra', 'otro');

  epoca: array[1..19] Of string = ('epoca', 'año', 'anio', 'años', 'anios',
                                   '60', '70', '80', '90', 'clasicos',
                                   'recientes', 'siglo 20', 'siglo xx', 'siglo 21', 'siglo xxi',
                                   'siglo', 'antiguo','2013', 'moderno');

  actor: array[1..2] Of string = ('me gusta', 'soy fan de');

  director: array[1..6] Of string = ('dirigidas por', 'dirigida por', 'dirijido', 'dirijida', 'dirigido', 'dirijidas');

  despedida: array[1..12] Of string = ('adios', 'hasta luego', 'nos vemos',
                                       'cuidate', 'hasta pronto',
                                       'que tengas un buen dia',
                                       'hasta la proxima', 'saludos',
                                       'despedida', 'hasta mañana', 'chao', 'chau');

  saludo: array[1..6] Of string = ('hola', 'buenos dias', 'buen dia', 
                                   'buenas tardes', 'buenas noches', 'buenas');

  saludos_respuesta: array[1..10] Of string = (
                 'bienvenido a nuestro servicio de recomendaciones de peliculas'
                                    ,
                     'estoy aqui para ayudarte a encontrar la pelicula perfecta'
                                    ,'listo para descubrir nuevas peliculas?',
                      'te ayudare a encontrar la pelicula ideal para esta noche'
                                    ,
                                    'vamos a explorar el mundo del cine juntos?'
                                    ,'preparado para una maraton de peliculas?',
                                   'dime tus preferencias y te recomendare algo'
                                    ,
                           'empezamos con algunas recomendaciones de peliculas?'
                                    ,
                                   'encantado de ayudarte a elegir una pelicula'
                                    ,
                            'listo para descubrir tu proxima pelicula favorita?'
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
                                            ,'pero puedo ofrecerte algo similar'
                                            ,
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
                                          'Que estes bien', 'Hasta la proxima',
                                          'Bye', 'Saludos');

Implementation

End.