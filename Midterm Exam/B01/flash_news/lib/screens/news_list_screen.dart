import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash_news/model/article.dart';
import 'package:flash_news/providers/article_provider.dart';
import 'package:flash_news/screens/add_news_article_form.dart';

class NewsListScreen extends ConsumerWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Article> article = ref.watch(articleProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Flash News',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(children: [
        DropdownButton<String>(
          isExpanded: true,
          menuWidth: 500,
          elevation: 8,
          items: <String>['All', 'Business', 'Politics', 'Technology']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: article.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading:
                        Image.asset("assets/images/${article[index].image}"),
                    title: Text(article[index].title),
                    subtitle: Row(
                      children: [
                        Text(article[index].category),
                        Text(article[index].author),
                        Text(article[index].date)
                      ],
                    ),
                    trailing: Text(article[index].article),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
