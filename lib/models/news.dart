class News {
  final String title;
  final String description;
  final String imageUrl;
  final String webUrl;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.webUrl,
  });

  factory News.fromMap(Map map) {
    return News(
      title: map['title'],
      description: map['description'] ?? '',
      imageUrl: map['urlToImage'] ?? 'https://picsum.photos/id/1/200/300',
      webUrl: map['url'],
    );
  }
}
