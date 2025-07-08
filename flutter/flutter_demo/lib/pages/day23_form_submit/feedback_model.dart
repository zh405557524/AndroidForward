class FeedbackForm {
  final String userName;
  final String content;

  FeedbackForm({required this.userName, required this.content});

  Map<String, dynamic> toJson() => {'name': userName, 'content': content};
}
