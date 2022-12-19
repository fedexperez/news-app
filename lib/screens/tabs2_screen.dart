import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/themes/themes.dart';
import 'package:news_app/widgets/widgets.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: Column(children: [
          const _CategoryList(),
          Expanded(child: NewsList(newsService.getArticlesSelectedCategory)),
        ]));
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final categories = newsService.categories;

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final categoryName = categories[index].categoryName;

          return GestureDetector(
            onTap: () {
              final newsService =
                  Provider.of<NewsService>(context, listen: false);
              newsService.selectedCategory = categoryName;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Column(
                children: [
                  _CategoryButton(category: categories[index]),
                  const SizedBox(height: 3),
                  Text(categoryName[0].toUpperCase() +
                      categoryName.substring(1)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(
        category.icon,
        color: (newsService.selectedCategory == category.categoryName)
            ? AppTheme.primary
            : Colors.black45,
      ),
    );
  }
}
