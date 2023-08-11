import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'NEWS_API_KEY', obfuscate: true)
  static String newsApiKey = _Env.newsApiKey;
}
