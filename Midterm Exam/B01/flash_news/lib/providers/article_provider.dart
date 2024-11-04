import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash_news/model/article.dart';
import 'package:flutter/services.dart';

final articleProvider =
    StateNotifierProvider<ArticleNotifier, List<Article>>((ref) {
  return ArticleNotifier();
});

class ArticleNotifier extends StateNotifier<List<Article>> {
  ArticleNotifier() : super([]) {
    loadArticles();
  }

  Future<void> loadArticles() async {
    // Simulate loading from JSON (replace with actual file loading if needed)
    final String response =
        await rootBundle.loadString('assets/data/articles.json');
    final List<dynamic> data = json.decode(response);
    state = data.map((json) => Article.fromJson(json)).toList();
  }

  List<Article> filterByCategory(String category) {
    return state.where((article) => article.category == category).toList();
  }
}
