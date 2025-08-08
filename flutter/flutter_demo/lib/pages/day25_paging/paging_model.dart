class Article {
  final int id;
  final String title;

  Article({
    required this.id,
    required this.title,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(id: json['id'], title: json['title']);


}
