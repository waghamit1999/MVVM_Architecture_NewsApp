import 'package:news_app/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/widgets/news_articles_card.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController _scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    context.read<HomeViewModel>().getTopNews(context: context, page: page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page++;
        context.read<HomeViewModel>().getTopNews(context: context, page: page);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('You are on $page page'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('News Express'),
        centerTitle: true,
      ),
      body: viewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        hintText: 'Search news here...',
                      ),
                      onSubmitted: (searchQuery) {
                        viewModel.searchNews(
                            context: context, searchQuery: searchQuery);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: viewModel.articles.length,
                      itemBuilder: (context, index) {
                        final news = viewModel.articles[index];
                        return NewsAriclesCard(
                          news: news,
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
