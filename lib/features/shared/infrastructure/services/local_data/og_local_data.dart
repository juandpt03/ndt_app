import 'package:ndt_app/features/home/domain/domain.dart';

final List<Content> ogLocalData = <Content>[
  Content(
    title: 'Definición',
    description:
        'Definición de la técnica y principio físico en el cual se basa',
    image: 'assets/images/home/3.png',
    information: {
      'Definición':
          'Las ondas guiadas son una técnica de inspección no destructiva que utiliza ondas elásticas para evaluar la integridad estructural de materiales, como tuberías, placas metálicas o cables, propagando estas ondas confinadas a sus bordes geométricos para detectar señales reflejadas de los defectos localizados en la estructura a lo largo de la superficie o el interior de la estructura. ',
      'Principio físico':
          'Las Ondas Guiadas funcionan bajo el clásico principio de reflexión Pulso – Eco, Mediante la utilización de varios anillos de transductores piezoeléctricos es posible generar ondas guiadas simétricas, longitudinales o torsionales según el sentido en que se coloquen los transductores, que se propagan en ambos sentidos de la tubería. El mecanismo de detección de discontinuidades se basa en que la propagación de estas ondas se encuentra determinada por la frecuencia de la onda y el espesor de la tubería. En los puntos donde la onda enfrenta un cambio en el espesor del ducto, ya sea que este se incrementa o reduce, un porcentaje de la energía rebota y regresa a los transductores en forma de eco.',
      'Transductores ultrasónicos':
          'Son dispositivos que convierten energía eléctrica en ondas ultrasónicas y viceversa. Estos transductores están compuestos típicamente por cristales piezoeléctricos, como el cuarzo o ciertos cerámicos, que tienen la capacidad de cambiar de forma cuando se les aplica una corriente eléctrica o generar una corriente eléctrica cuando se les somete a presión. Esta propiedad se utiliza para convertir la energía eléctrica en vibraciones mecánicas (o viceversa).',
      'Frecuencias de ondas guiadas':
          'En la inspección por ondas guiadas las frecuencias de operación van desde 20 kHz hasta aproximadamente 500 kHz.',
      'Modos de Ondas guiadas para tuberías':
          'Ondas Longitudinales: son un tipo de onda en la que la vibración o perturbación ocurre en la misma dirección en la que se propaga la onda.  Este modo de onda presenta la particularidad de interactuar con los líquidos dentro de una tubería, lo que puede resultar en la atenuación de la onda y, por ende, afectar los resultados de la inspección. En contraste con los modos torsionales, los modos longitudinales exhiben una capacidad de excitación y repetición superiores.',
      'Ondas torsionales':
          'Son un tipo de onda mecánica en las que las partículas del medio se mueven de forma perpendicular a la dirección de propagación. En estas ondas, la energía se transmite a través de un medio sólido y se caracterizan por movimientos de torsión o rotación alrededor de un eje. Los modos torsionales se prefieren sobre los longitudinales ya que la fuga de energía al medio circundante o al medio que la rodea es menor, por lo cual brindan una menor atenuación de las ondas. Con este modo de onda se detectan grietas axiales y corrosión.',
      'Ondas Flexurales':
          'Son un tipo de onda se caracterizan por la flexión o curvatura de la estructura en diferentes secciones transversales mientras se propagan a lo largo del material. Cada modo de onda flexural tiene una frecuencia natural asociada, que depende de la geometría de la estructura y de las propiedades del material. En operación normal, una onda de flexión se produce por una conversión de modo cuando una onda axisimétrica interactúa con una característica de tubería no simétrica, como un soporte, rama o conexión de tubería, corrosión, grieta, entre otros.',
      'Modos de Ondas guiadas para placas':
          'Ondas transversales: son un tipo de onda mecánica en las que las partículas del medio se mueven perpendicularmente a la dirección en la que la onda se propaga. Pueden presentarse en 2 formas: las ondas de corte horizontal SH (horizontal shear wave) y las de corte vertical SV (vertical shear wave). Las ondas SH son usadas en la inspección de submarinos ya que no sufren atenuación por causa del medio líquido y pierden poca energía en superficies curvas y cilíndricas como tuberías. Además, no sufre conversión de modo (siempre y cuando no haya cambio repentino en el espesor de la superficie), ni variación de amplitud cuando la onda es reflejada, de igual manera poseen menos reflexión y atenuación en contraste con las ondas SV.',
      'Ondas de Lamb':
          'Son un tipo de ondas ultrasónicas guiadas entre dos superficies libres paralelas, como las superficies superior e inferior de una placa. Las ondas de Lamb simétricas se parecen a las ondas axiales, mientras que las ondas de Lamb antisimétricas se parecen a las ondas de flexión. Las ondas Lamb son altamente dispersivas y su velocidad depende del producto entre la frecuencia y el espesor de la placa. La propagación depende de la densidad y las propiedades elásticas del material. Son útiles para escanear placas de metal porque tienen la capacidad de viajar varios metros a lo largo del acero.',
    },
    images: [
      'assets/images/home/definicion.png',
      'assets/images/home/principio.png',
      'assets/images/home/transductores.png',
      'assets/images/home/frecuencias.png',
      'https://www.electrontools.com/Home/WP/wp-content/uploads/2016/09/Ondas-longitudinales.gif',
      'assets/images/home/ondas_torsionales.gif',
      'assets/images/home/ondas_flexurales.gif',
      'assets/images/home/transversal.gif',
      'assets/images/home/ondas_lamb.png',
    ],
  ),
  Content(
    title: 'Descripción',
    description:
        'Descripción detallada del ensayo basados en Normas o códigos aplicables',
    image: 'assets/images/home/2.png',
    information: {
      'Preparación:':
          '''Normas Aplicables: Dependiendo de la industria, se pueden seguir normas específicas de preparación del área de ensayo. 
             Inspección Preliminar: Evaluar la estructura para identificar áreas críticas y determinar la configuración de las ondas guiadas.''',
      'Selección del Método de Ensayo:':
          '''Normas Aplicables: Pueden existir normas específicas para la selección del método de ondas guiadas, como ASTM E2700 para ensayos ultrasónicos utilizando ondas guiadas. 
             Consideración del Material: La elección del método puede depender del tipo de material y de los defectos que se buscan. ''',
      'Configuración del Sistema:':
          '''Normas Aplicables: ASTM E1962 proporciona orientación sobre la configuración del sistema y la calibración para ensayos de ondas guiadas. 
             Calibración del Equipo: Asegurar que el equipo esté calibrado según las especificaciones de la norma aplicable.''',
      'Realización del Ensayo:':
          '''Normas Aplicables: Pueden aplicarse normas específicas para la ejecución de ensayos no destructivos, como ISO 16811 para ensayos en estructuras metálicas.
             Registro de Datos: Documentar de manera precisa y completa los datos recopilados durante el ensayo. ''',
      'Análisis de Datos:':
          '''Normas Aplicables: Normas como ASTM E1065 pueden proporcionar pautas para el análisis de datos y la interpretación de resultados.
               Criterios de Aceptación: Evaluar si los resultados cumplen con los criterios de aceptación establecidos por normas o estándares de la industria.''',
      'Informe Final:':
          '''Normas Aplicables: Preparar un informe final que siga las normas pertinentes, como ASTM E1359 para informes de ensayos no destructivos. 
             Inclusión de Resultados y Recomendaciones: Detallar los resultados del ensayo, cualquier defecto detectado y recomendaciones para acciones correctivas.''',
      'Normas Aplicables:':
          '''ASTM E1962 - Standard Test Method for Ultrasonic Surface Waves: 
             Esta norma proporciona pautas para la configuración del sistema y la calibración de equipos utilizados en ensayos de ondas guiadas. 
             ISO 16811 - Non-destructive testing of steel structures by X-ray radiography, gamma ray radiography, and f4 radiographic testing of welded joints: 
             Esta norma proporciona directrices específicas para ensayos no destructivos en estructuras metálicas, que podrían incluir el uso de ondas guiadas. 
             ASTM E1065 - Standard Practice for Evaluating Characteristics of Ultrasonic Search Units: 
             Esta norma se centra en las características de las unidades de búsqueda ultrasónicas, que podrían ser aplicables al uso de ondas guiadas. 
             ISO 16810 - Notn-destructive testing — Ultrasonic testing — Time-of-flight diffraction technique as a method for detection and sizing of discontinuities: 
             Esta norma aborda la écnica de difracción de tiempo de vuelo, que es relevante para la detección de discontinuidades mediante ondas guiadas.''',
    },
    images: [
      'assets/images/home/preparacion.png',
      'assets/images/home/seleccion.png',
      'assets/images/home/calibracion.png',
      'assets/images/home/realizacion.png',
      'assets/images/home/analisis.png',
      'assets/images/home/informe.gif',
      'assets/images/home/normas.png',
    ],
  ),
  Content(
    title: 'Ventajas y limitaciones',
    description: 'Aspectos para definir criterios para seleccionar la técnica',
    image: 'assets/images/home/5.png',
    information: {
      'Ventajas Generales':
          '''Detectar y localizar defectos como: áreas de pérdidas de material por corrosión, grietas circunferenciales y grietas axiales.
      Capacidad para efectuar escaneos en tuberías de acceso limitado, como aquellas que se encuentran enterradas, revestidas, aisladas y que atraviesan taludes y terraplenes. Permitiendo reducir los costos vinculados a la excavación y remoción/reinstalación del material de aislamiento. 
      Inspeccionar hasta 80 metros en dirección lineal sin cambios de dirección dentro de una tubería aérea sin recubrimiento (sólo pintura) y detectar defectos hasta 4% del total de la sección transversal del tubo.
      Conocer el estado actual de la tubería en tiempo real. 
      Cobertura de monitoreo al 100 % del espesor del material.  
      Inspecciones en servicio, dependiendo de las temperaturas de la superficie del tubo (ninguna limitación en producción).''',
      'Limitaciones Generales':
          '''Temperaturas por encima de los 120°C y máximo 260°C.
          Profundidad de inspección limitada: Dependiendo del tipo de onda guiada y la frecuencia utilizada, la profundidad a la que pueden detectar defectos puede estar limitada. 
Algunas ondas guiadas solo pueden penetrar hasta cierta profundidad en el material.Complejos arreglos geométricos de las tuberías limitan el alcance de las evaluaciones. 
Interpretación de datos compleja. 
Requiere de personal altamente calificado.
Requiere equipo especializado (costoso).
Requiere de un alto nivel de conocimiento de la estructura a inspeccionar.''',
      'Atenuación Baja':
          'Las ondas guiadas a menudo experimentan una atenuación menor en comparación con las ondas no guiadas, lo que significa que la señal puede transmitirse a distancias más largas sin una pérdida significativa de intensidad.',
      'Inmunidad a Interferencias':
          'Las ondas guiadas pueden ser menos susceptibles a interferencias externas en comparación con las ondas no guiadas, ya que están confinadas a una estructura específica. ',
      'Seguridad':
          'La propagación de la onda a lo largo de una guía específica puede proporcionar cierto nivel de seguridad, ya que la señal puede ser más difícil de interceptar en comparación con las ondas radiadas. ',
      'Direccionalidad':
          'Las ondas guiadas pueden ser direccionadas y controladas con mayor precisión, lo que es beneficioso en aplicaciones como comunicaciones y sistemas de detección.',
      'Pérdidas de Acoplamiento':
          'Las ondas guiadas pueden experimentar pérdidas significativas de energía cuando se acoplan o se conectan a otras estructuras, lo que puede afectar la eficiencia del sistema. ',
      'Dependencia de la Estructura':
          ' La eficiencia y las características de propagación de las ondas guiadas pueden depender en gran medida de la estructura física que las guía, lo que puede limitar su aplicabilidad en ciertos entornos. ',
      'Costos de Implementación':
          ' La instalación de sistemas que utilizan ondas guiadas, como fibras ópticas, puede ser costosa en comparación con algunas alternativas.',
      'Sensibilidad a Daños':
          'Las estructuras que guían las ondas pueden ser susceptibles a daños físicos, lo que podría afectar la calidad de la transmisión. ',
    },
    images: [
      'assets/images/home/ventajas.png',
      'assets/images/home/desventajas.png',
      'assets/images/home/atenuacion.png',
      'assets/images/home/inmunidad.png',
      'assets/images/home/seguridad.png',
      'assets/images/home/direccionalidad.png',
      'assets/images/home/perdidas.png',
      'assets/images/home/dependencia.png',
      'assets/images/home/costos.png',
      'assets/images/home/sensibilidad.png',
    ],
  ),
  Content(
    title: 'Aplicaciones',
    description:
        'Ejemplos, casos de estudio, aplicaciones en la industria, etc.',
    image: 'assets/images/home/1.png',
    information: {
      'Inspección de Estructuras Metálicas:':
          '''Aplicación: Las ondas guiadas se utilizan para inspeccionar estructuras metálicas, como tuberías o placas, en busca de grietas o corrosión. 
Ejemplo: En la industria del petróleo y gas, las ondas guiadas se emplean para evaluar la integridad de los oleoductos. Se pueden enviar ondas a lo largo del tubo y analizar las reflexiones para identificar posibles puntos de corrosión o fallas. 
Mecanismos de Daño: Corrosión, erosión, grietas por fatiga. 
''',
      'Monitorización de Fibras Ópticas en Estructuras Civiles: ':
          '''Aplicación: Las ondas guiadas en fibras ópticas se utilizan para monitorizar estructuras civiles como puentes o edificios, detectando cambios en la deformación o posibles daños. 
Ejemplo: Se instalan sensores de fibras ópticas en la estructura de un puente. Las ondas guiadas en las fibras pueden detectar pequeños cambios en la deformación de la estructura, lo que ayuda a identificar posibles problemas estructurales. 
Mecanismos de Daño: Deformación estructural, vibraciones anómalas.  
''',
      'Inspección de Materiales Compuestos en la Industria Aeroespacial: ': '''
Aplicación: Las ondas guiadas se utilizan para inspeccionar materiales compuestos en aviones y otras aplicaciones aeroespaciales en busca de delaminaciones u otros defectos. 
Ejemplo: Se aplican ondas guiadas a lo largo de una superficie compuesta. Las discontinuidades, como delaminaciones entre capas, afectan la propagación de las ondas, lo que permite detectar y localizar defectos. 
Mecanismos de Daño: Delaminación, desprendimiento de capas. 
''',
      'Detección de Fugas en Tuberías Enterradas:': '''
Aplicación: Las ondas guiadas se utilizan para detectar fugas en tuberías enterradas, como las utilizadas para el suministro de agua. 
Ejemplo: Se envían ondas a lo largo de la tubería y se monitorea la propagación de la señal. Si hay una fuga, parte de la señal se dispersa, lo que indica la presencia de un problema. 
Mecanismos de Daño: Fugas, corrosión. 
''',
      'Evaluación de Condiciones en Estructuras Offshore:': '''
Aplicación: Las ondas guiadas se aplican para evaluar la integridad de las estructuras offshore, como plataformas de perforación. 
Ejemplo: Se envían ondas a través de las piernas de una plataforma offshore. Cambios en las características de las ondas podrían indicar corrosión u otros problemas estructurales. 
Mecanismos de Daño: Corrosión, fatiga. 
'''
    },
    images: [
      'assets/images/home/estructuras.png',
      'assets/images/home/monitorizacion.png',
      'assets/images/home/materiales.png',
      'assets/images/home/deteccion.png',
      'assets/images/home/evaluacion.png',
    ],
  ),
];
