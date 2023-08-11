import '../config/env.dart';

class EndPoints {
  static const _baseUrl = 'https://newsapi.org/v2';
  static topNewsUrl() =>
      '$_baseUrl/top-headlines?country=us&apiKey=${Env.newsApiKey}';

  static searchNewsUrl({required String searchQuery}) =>
      "$_baseUrl/everything?q=$searchQuery&apiKey=${Env.newsApiKey}";
}
