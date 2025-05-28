class Article {
  final String title;
  final String body;

  Article({required this.title, required this.body});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(title: json['title'] ?? '', body: json['body'] ?? '');
  }
}
