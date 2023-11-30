import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String chatGptApiKey = dotenv.env['chatGptApiKey'] ?? 'No hay ApiKey';
}
