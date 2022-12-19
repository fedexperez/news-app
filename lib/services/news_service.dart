import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:news_app/models/models.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier {
  final String _newsUrl = 'newsapi.org';
  final String _apiKey = 'YOUR_NEWS_API_KEY';
  final String country = 'co';
  final String url = '/v2/top-headlines';

  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(icon: FontAwesomeIcons.building, categoryName: 'business'),
    Category(icon: FontAwesomeIcons.tv, categoryName: 'entertainment'),
    Category(icon: FontAwesomeIcons.addressCard, categoryName: 'general'),
    Category(icon: FontAwesomeIcons.headSideVirus, categoryName: 'health'),
    Category(icon: FontAwesomeIcons.vials, categoryName: 'science'),
    Category(icon: FontAwesomeIcons.volleyball, categoryName: 'sports'),
    Category(icon: FontAwesomeIcons.memory, categoryName: 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    for (Category element in categories) {
      categoryArticles[element.categoryName] = [];
    }
  }

  String get selectedCategory => _selectedCategory;

  List<Article> get getArticlesSelectedCategory =>
      categoryArticles[selectedCategory]!;

  set selectedCategory(String valor) {
    _selectedCategory = valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  getTopHeadlines() async {
    final Uri newsUri =
        Uri.https(_newsUrl, url, {'country': country, 'apiKey': _apiKey});

    final resp = await http.get(newsUri);
    final headlinesResponse = TopHeadlinesResponse.fromJson(resp.body);
    headlines.addAll(headlinesResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }

    final Uri newsUri = Uri.https(_newsUrl, url,
        {'country': country, 'apiKey': _apiKey, 'category': category});

    final resp = await http.get(newsUri);
    final categoryHeadlinesResponse = TopHeadlinesResponse.fromJson(resp.body);

    categoryArticles[category]!.addAll(categoryHeadlinesResponse.articles);
    notifyListeners();
  }
}
