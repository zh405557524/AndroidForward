class Article {
  final int id;
   String title;
   String body;

  Article({required this.id, required this.title, required this.body});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(id: json['id'], title: json['title'] ?? '', body: json['body'] ?? '');
  }
}
