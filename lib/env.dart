import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  Env._();

  static Future init() async {
    await dotenv.load(
      fileName: "assets/.env",
      overrideWithFiles: [
        kReleaseMode ? "assets/.env.production" : "assets/.env.development",
      ],
    );
  }

  static String get dummyClientUrl {
    const String key = "DUMMY_CLIENT_URL";
    return dotenv.env[key] ?? _throw(key);
  }

  static String _throw(String key) =>
      throw Exception('❌ Environment variable $key not found');
}
