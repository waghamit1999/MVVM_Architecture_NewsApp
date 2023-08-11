import 'package:get_it/get_it.dart';
import 'package:news_app/repositories/news_repository.dart';
import 'package:news_app/services/network/api_service.dart';

final getIt = GetIt.instance;

void injectDependencies() {
  getIt.registerSingleton<APIService>(APIService());
  getIt.registerSingleton<NewsRepository>(
      NewsRepositoryImp(apiService: getIt<APIService>()));
}
