import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewsWebsiteView extends StatefulWidget {
  final String webUrl;
  const NewsWebsiteView({super.key, required this.webUrl});

  @override
  State<NewsWebsiteView> createState() => _NewsWebsiteViewState();
}

class _NewsWebsiteViewState extends State<NewsWebsiteView> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.webUrl)),
            onProgressChanged: (controller, progress) {
              if (progress == 100) {
                isLoading = false;
                setState(() {});
              }
            },
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
