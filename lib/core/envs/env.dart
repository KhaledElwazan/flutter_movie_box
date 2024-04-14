import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'assets/.env', useConstantCase: true)
final class Env {
  @EnviedField(varName: 'API_KEY', useConstantCase: true)
  static const String apiKey = _Env.apiKey;

  @EnviedField(varName: 'BASE_URL', useConstantCase: true)
  static const String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'IMAGE_BASE_URL', useConstantCase: true)
  static const String imageBaseUrl = _Env.imageBaseUrl;

  @EnviedField(varName: 'API_BASE_URL', useConstantCase: true)
  static const String apiBaseUrl = _Env.apiBaseUrl;
}
