
import 'package:flutter/material.dart';

import '../model/news.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset("assets/img/${news.image}", fit: BoxFit.fitWidth,),
          Container(margin: const EdgeInsets.all(10),),
          Text(news.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          Container(margin: const EdgeInsets.all(10),),
          Text(news.description, style: const TextStyle(fontSize: 18),),
        ],
      ),
    );
  }
}
