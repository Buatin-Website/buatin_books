import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'NYC_API_KEY', obfuscate: true)
  static String nycApiKey = _Env.nycApiKey;
}