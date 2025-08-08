
import '../../models/article_model.dart';

class PagingService {
  static Future<List<Article>> fetchArticles({int page = 1, int size = 10}) async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(
      size,
      (i) => Article(
        id: (page - 1) * size + 1,
        title: 'Article ${(page - 1) * size + i + 1}', body: '',
      ),
    );
  }
}
