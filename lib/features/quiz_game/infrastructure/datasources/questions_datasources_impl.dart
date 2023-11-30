import 'package:ndt_app/features/quiz_game/domain/domain.dart';

class QuestionsDataSourcesImpl extends QuestionsDataSource {
  @override
  Future<List<Question>> getQuestions() async {
    final List<Question> questions = <Question>[
      Question(
        image: 'assets/images/questions/1.png',
        question:
            '¿Qué parte de las estructuras utiliza las ondas guiadas para su guía?',
        answer: 0,
        options: [
          'Bordes de la estructura.',
          'Parte posterior de la estructura.',
          'Las caras superiores de la estructura.',
          'La parte frontal de la estructura',
        ],
      ),
      Question(
        image: 'assets/images/questions/2.png',
        question:
            '¿Cuál es el diámetro mínimo de tubería que se puede inspeccionar mediante el método de ondas guiadas?',
        answer: 0,
        options: [
          '2”',
          '3.5”',
          '4.5”',
          'b y c son correctas',
        ],
      ),
      Question(
        image: 'assets/images/questions/3.png',
        question:
            '¿Cuál es la temperatura máxima de inspección de ondas guiadas?',
        answer: 2,
        options: [
          '265°C',
          '71°C',
          '260°C',
          '120°F',
        ],
      ),
      Question(
        image: 'assets/images/questions/4.png',
        question:
            '¿Cuál de estas piezas no se puede inspeccionar con ondas guiadas?',
        answer: 3,
        options: [
          'Tuberías y tanques',
          'Soportes de apoyo',
          'Soportes soldados',
          'Ninguna de las anteriores',
        ],
      ),
      Question(
        image: 'assets/images/questions/5.png',
        question:
            '¿Cuál de las siguientes opciones es una ventaja de las de Ondas Guiadas en la inspección de tuberías?',
        answer: 3,
        options: [
          'Permite determinar la presencia de daño por corrosión en áreas inaccesibles  de la tubería.',
          'Proporciona datos sobre la condición global de la tubería.',
          'Facilita la inspección de varios metros de tubería desde un solo punto de inspección.',
          'Todas las anteriores.',
        ],
      ),
      Question(
        image: 'assets/images/questions/6.png',
        question:
            '¿Qué se detecta y localiza mediante la inspección mediante ondas guiadas?',
        answer: 3,
        options: [
          'Pérdidas de material por corrosión.',
          'Grietas circunferenciales.',
          'Grietas axiales.',
          'Todas las anteriores.',
        ],
      ),
      Question(
        image: 'assets/images/questions/7.png',
        question:
            '¿Cuántos metros en dirección lineal de una tubería se pueden inspeccionar con ondas guiadas?',
        answer: 1,
        options: [
          '2m',
          'Varía dependiendo de las condiciones de la tubería.',
          '30m',
          '68m',
        ],
      ),
      Question(
        image: 'assets/images/questions/8.png',
        question: 'Qué norma se recomienda para la técnica de ondas guiadas?',
        answer: 3,
        options: [
          'ASTM E65',
          'ASTM E709',
          'API 1104',
          'API 570',
        ],
      ),
      Question(
        image: 'assets/images/questions/9.png',
        question:
            'Las ondas Lamb son altamente dispersivas y su velocidad depende del producto entre la frecuencia y el espesor de la placa.',
        answer: 1,
        options: [
          'Falso',
          'Verdadero',
        ],
      ),
      Question(
        image: 'assets/images/questions/10.png',
        question:
            'La habilidad de los transductores para detectar ecos de defectos pequeños es una definición para:',
        answer: 0,
        options: [
          'Sensibilidad',
          'Resolución',
          'Exactitud',
          'a y b son correctas.',
        ],
      ),
      Question(
        image: 'assets/images/questions/11.png',
        question:
            '¿Qué tipo de curva se utiliza para corregir las reflexiones de ondas guiadas?',
        answer: 0,
        options: [
          'DAC',
          'PET',
          'TVG',
          'Tangenciales',
        ],
      ),
      Question(
        image: 'assets/images/questions/12.png',
        question:
            'El movimiento de las partículas de las ondas Rayleigh es usualmente descrito como:',
        answer: 3,
        options: [
          'Sinusoidal',
          'Circunferencial',
          'Elíptico',
          'Todas las anteriores.',
        ],
      ),
      Question(
        image: 'assets/images/questions/13.png',
        question:
            'La pérdida gradual de energía como vibración ultrasónica a través del viaje del material de referencia es conocida como:',
        answer: 1,
        options: [
          'Reflexión.',
          'Atenuación.',
          'Difracción.',
          'Dispersión.',
        ],
      ),
      Question(
        image: 'assets/images/questions/14.png',
        question:
            'Para modificar la longitud de onda en una pieza sometida a prueba lo que se podría hacer sería:',
        answer: 2,
        options: [
          'Modificar el voltaje de pulso.',
          'Cambiar el transductor.',
          'Cambiar la frecuencia',
          'Todas las anteriores.',
        ],
      ),
      Question(
        image: 'assets/images/questions/15.png',
        question:
            'En la inspección por ondas guiadas las frecuencias de operación van entre:',
        answer: 2,
        options: [
          '10 y 100 MHz.',
          '20 y 350 kHz.',
          '20 y 500 MHz',
          'Todas las anteriores.',
        ],
      ),
    ];
    return await Future<List<Question>>.value(questions);
  }
}
