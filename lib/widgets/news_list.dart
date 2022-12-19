import 'package:flutter/material.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/themes/themes.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.newsList, {super.key});

  final List<Article> newsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return _NewsItem(
          newsItem: newsList[index],
          index: index,
        );
      },
    );
  }
}

class _NewsItem extends StatelessWidget {
  const _NewsItem({
    Key? key,
    required this.newsItem,
    required this.index,
  }) : super(key: key);

  final Article newsItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar(newsItem: newsItem, index: index),
        _CardTitle(newsItem: newsItem),
        _CardImage(newsItem: newsItem),
        _CardDescription(newsItem: newsItem),
        const _CardButtons(),
        const Divider(),
      ],
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({
    Key? key,
    required this.newsItem,
  }) : super(key: key);

  final Article newsItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        newsItem.title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  const _CardTopBar({
    Key? key,
    required this.newsItem,
    required this.index,
  }) : super(key: key);

  final Article newsItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1} ',
            style: TextStyle(
                color: AppTheme.secondary, fontWeight: FontWeight.bold),
          ),
          Text(newsItem.source.name)
        ],
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({Key? key, required this.newsItem}) : super(key: key);

  final Article newsItem;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      child: Container(
        width: size.width,
        height: size.height * 0.25,
        margin: const EdgeInsets.only(bottom: 10, top: 5),
        child: (newsItem.urlToImage != null)
            ? FadeInImage(
                fit: BoxFit.cover,
                placeholder:
                    const AssetImage('assets/images/loading-image.gif'),
                image: NetworkImage(newsItem.urlToImage!),
              )
            : Image.asset('assets/images/no-image.png'),
      ),
    );
  }
}

class _CardDescription extends StatelessWidget {
  const _CardDescription({
    Key? key,
    required this.newsItem,
  }) : super(key: key);

  final Article newsItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(newsItem.description ?? ''),
    );
  }
}

class _CardButtons extends StatelessWidget {
  const _CardButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RawMaterialButton(
          onPressed: (() {}),
          fillColor: AppTheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border),
        ),
        RawMaterialButton(
          onPressed: (() {}),
          fillColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
