import 'package:Favorit/utils/storage.dart';
import 'package:flutter/material.dart';

import '../model/news.dart';
import 'news_page.dart';

class ListNewsPage extends StatefulWidget {
  const ListNewsPage({Key? key}) : super(key: key);

  @override
  State<ListNewsPage> createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<News>>(
        future: Storage.getListNews(context),
        builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return const Center(
              child: CircularProgressIndicator(),
            );
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<News>? list = snapshot.data;
                return ListView.builder(
                  itemCount: list?.length,
                  itemBuilder: (context, index){
                    return GestureDetector(child: Card(
                      child: Column(
                        children: [
                          Image.asset("assets/img/${list![index].image}", fit: BoxFit.fitWidth,),
                          Container(margin: const EdgeInsets.all(10),),
                          Text(list[index].title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsPage(news: list[index],)),
                      );
                    },);
                  },
                );
              }
          }
        },
      ),
    );
  }
}
