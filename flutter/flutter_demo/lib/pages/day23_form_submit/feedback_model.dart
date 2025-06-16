class FeedbackForm {
  final String name;
  final String content;

  FeedbackForm({required this.name, required this.content});

  Map<String, dynamic> toJson() => {'name': name, 'content': content};
}
