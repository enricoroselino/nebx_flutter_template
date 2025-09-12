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
}
