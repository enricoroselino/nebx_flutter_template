import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nebx_flutter_template/infrastructure/clients/client_builder.dart';
import 'package:nebx_flutter_template/infrastructure/clients/some_interceptor.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/decoder.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/logger.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/security_check.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/shared_preferences.dart';
import 'package:nebx_flutter_template/infrastructure/services/decoder_impl.dart';
import 'package:nebx_flutter_template/infrastructure/services/logger_impl.dart';
import 'package:nebx_flutter_template/infrastructure/services/security_check_impl.dart';
import 'package:nebx_flutter_template/infrastructure/services/shared_preferences_impl.dart';

final loc = GetIt.instance;

class SetupDependencies {
  SetupDependencies._();

  static init() async {
    loc.registerSingleton<ILogger>(LoggerImpl());
    loc.registerSingleton<ISecurityCheck>(SecurityCheckImpl());
    loc.registerSingleton<ISharedPreferences>(SharedPreferencesImpl());
    loc.registerSingleton<IDecoder>(DecoderImpl());

    loc.registerLazySingleton<Dio>(() {
      final client = Dio();
      return ClientBuilder(client: client)
          .setBaseUrl("https://pokeapi.co/api/v2/")
          .setRetryCount(2)
          .setInterceptor(SomeInterceptor())
          .build();
    });

    await loc.allReady();
  }
}
