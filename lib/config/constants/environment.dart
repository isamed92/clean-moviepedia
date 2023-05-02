import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDBKey =
      dotenv.env['THE_MOVIDEDB_KEY'] ?? 'API KEY DOES NOT EXISTS';
}
