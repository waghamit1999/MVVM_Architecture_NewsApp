import 'package:flutter/material.dart';
import 'package:news_app/dependency_injection/injection.dart';
import 'package:news_app/repositories/news_repository.dart';
import 'package:news_app/routes/router.dart';
import 'package:news_app/view_models/home_view_model.dart';
import 'package:news_app/ui/views/home_view.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          HomeViewModel(newsRepository: getIt<NewsRepository>()),
      child: MaterialApp.router(
        routerConfig: AppRouter(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
