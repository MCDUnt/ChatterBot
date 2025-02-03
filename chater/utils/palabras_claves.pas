
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


                 'bienvenido a nuestro servicio de recomendaciones de peliculas'
                                    ,


                     'estoy aqui para ayudarte a encontrar la pelicula perfecta'
                                    ,
                                    'listo para descubrir nuevas peliculas?'
                                    ,


                      'te ayudare a encontrar la pelicula ideal para esta noche'
                                    ,
                                    'vamos a explorar el mundo del cine juntos?'
                                    ,
                                    'preparado para una maraton de peliculas?',


                                   'dime tus preferencias y te recomendare algo'
                                    ,


                           'empezamos con algunas recomendaciones de peliculas?'
                                    ,


                                   'encantado de ayudarte a elegir una pelicula'
                                    ,


                            'listo para descubrir tu proxima pelicula favorita?'
                                   );

  resp_positivas: array[1..10] Of string = ('genial, encontre lo que buscabas',


                                          'perfecto, aqui tienes lo que pediste'
                                            ,


                                     'excelente, esto es justo lo que necesitas'
                                            ,


                                       'fantastico, encontre una opcion para ti'
                                            ,


                                  'maravilloso, esto es lo que estabas buscando'
                                            ,
                                            'increible, aqui esta tu resultado',
                                            'estupendo, encontre lo que querias'
                                            , 'super, esto es lo que necesitas',


                                           'magnifico, aqui tienes tu resultado'
                                            , 'bravo, encontre lo que pediste');

  resp_negativas: array[1..10] Of string = (


                                          'lo siento, no encontre coincidencias'
                                            ,


                            'lamentablemente, no pude encontrar lo que buscabas'
                                            ,


                               'no hay resultados que coincidan con tu busqueda'
                                            ,


                   'no encontre ninguna opcion que se ajuste a tus preferencias'
                                            ,


                        'lo siento, no pude encontrar una pelicula que coincida'
                                            , 'no hay coincidencias disponibles'
                                            ,


                                      'no encontre resultados para tu solicitud'
                                            ,


                                  'lamentablemente, no hay opciones disponibles'
                                            ,


                  'no pude encontrar una pelicula que se ajuste a lo que buscas'
                                            ,


                               'lo siento, no hay coincidencias en este momento'
                                           );

  resp_ingreso_neg: array[1..10] Of string = (


                                        'parece que hubo un error en tu mensaje'
                                              ,


                                       'lo siento, no entendi lo que ingresaste'
                                              ,


                           'por favor, verifica tu mensaje e intenta nuevamente'
                                              ,


                               'no pude procesar tu solicitud, intenta de nuevo'
                                              ,


                'parece que hubo un problema con tu mensaje, por favor revisalo'
                                              ,


                          'no reconozco ese mensaje, intenta con algo diferente'
                                              ,


                                   'hubo un error, por favor intenta nuevamente'
                                              ,


                               'no pude entender tu solicitud, intenta de nuevo'
                                              ,


                     'parece que ingresaste algo incorrecto, por favor revisalo'
                                              ,


                                       'lo siento, no pude procesar ese mensaje'
                                             );

  saludosAdios: array[1..10] Of string = ('Adios', 'Hasta luego', 'Nos vemos',
                                          'Cuidate', 'Chao', 'Hasta pronto',
                                          'Que estes bien', 'Hasta la proxima'
                                          , 'Bye', 'Saludos');

Implementation

End.
