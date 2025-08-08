class Article {
  int id;
  String title;
  String summary;
  String cover;

  Article({
    required this.id,
    required this.title,
    required this.summary,
    this.cover = '',
  });
}
