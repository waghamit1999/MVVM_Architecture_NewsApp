import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/repositories/news_repository.dart';
import '../utils/dialog_box.dart';

class HomeViewModel extends ChangeNotifier {
  final NewsRepository _newsRepository;
  HomeViewModel({required NewsRepository newsRepository})
      : _newsRepository = newsRepository;
  List<News> _articles = [];
  List<News> get articles => _articles;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> getTopNews(
      {required BuildContext context, required int page}) async {
    final response = await _newsRepository.getTopNews(page: page);
    response.fold(
        (l) => showAppDialog(
              context: context,
              title: l,
            ),
        (r) => _articles = r);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> searchNews(
      {required BuildContext context, required String searchQuery}) async {
    _isLoading = true;
    notifyListeners();
    final response = await _newsRepository.searchNews(searchQuery: searchQuery);
    response.fold(
        (l) => showAppDialog(
              context: context,
              title: l,
            ),
        (r) => _articles = r);
    _isLoading = false;
    notifyListeners();
  }
}
