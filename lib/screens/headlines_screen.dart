import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_app/services/news_service.dart';
import 'package:news_app/themes/themes.dart';
import 'package:news_app/widgets/widgets.dart';

class HeadlinesScreen extends StatefulWidget {
  const HeadlinesScreen({Key? key}) : super(key: key);

  @override
  State<HeadlinesScreen> createState() => _HeadlinesScreenState();
}

class _HeadlinesScreenState extends State<HeadlinesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final newsService = Provider.of<NewsService>(context);
    final headlines = newsService.headlines;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Headlines'),
      ),
      body: (headlines.isEmpty)
          ? Center(
              child: CircularProgressIndicator(
                color: AppTheme.primary,
              ),
            )
          : NewsList(headlines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
