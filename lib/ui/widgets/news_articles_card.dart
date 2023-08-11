import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/routes/router_list.dart';
import 'package:news_app/ui/views/news_web_view.dart';

class NewsAriclesCard extends StatelessWidget {
  final News news;
  const NewsAriclesCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.push(Routes.webView, extra: news.webUrl);
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: ((context) {
          //       return NewsWebsiteView(
          //         webUrl: news.webUrl,
          //       );
          //     }),
          //   ),
          // );
        },
        leading: Container(width: 100, child: Image.network(news.imageUrl)),
        title: Text(news.title),
        subtitle: Text(news.description),
      ),
    );
  }
}
