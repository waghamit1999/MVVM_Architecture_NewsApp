import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:news_app/constants/endpoints.dart';
import 'package:news_app/services/network/api_service.dart';
import '../models/news.dart';

abstract class NewsRepository {
  Future<Either<String, List<News>>> getTopNews({required int page});
  Future<Either<String, List<News>>> searchNews({required String searchQuery});
}

class NewsRepositoryImp implements NewsRepository {
  final APIService _apiService;
  NewsRepositoryImp({required APIService apiService})
      : _apiService = apiService;
  @override
  Future<Either<String, List<News>>> getTopNews({required int page}) async {
    List<News> articles = [];
    try {
      final response =
          await _apiService.getRequest('${EndPoints.topNewsUrl()}&page=$page');
      articles =
          (response['articles'] as List).map((e) => News.fromMap(e)).toList();
    } catch (e) {
      return left(e.toString());
    }
    return right(articles);
  }

  @override
  Future<Either<String, List<News>>> searchNews(
      {required String searchQuery}) async {
    List<News> articles = [];

    try {
      final response = await _apiService
          .getRequest('${EndPoints.searchNewsUrl(searchQuery: searchQuery)}');
      articles =
          (response['articles'] as List).map((e) => News.fromMap(e)).toList();
    } catch (e, s) {
      return left(e.toString());
    }
    return right(articles);
  }

  List<News> getListNewsArticles(String json) {
    final mapResponse = jsonDecode(json);
    return (mapResponse['articles'] as List)
        .map((e) => News.fromMap(e))
        .toList();
  }
}
