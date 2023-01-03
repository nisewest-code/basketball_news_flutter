import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';

import '../model/news.dart';

class Storage{
  static const String _database_name = "storage_d_tz";
  static Future<String?> getValue(String key) async {
    final storage = LocalStorage(_database_name);
    // bool b = await storage.ready;
    // return b ? storage.getItem(key) : null;
    return storage.ready.then((e) => e ? storage.getItem(key) : null);
  }

  static Future<void> setValue(String key, String value) async{
    final storage = LocalStorage(_database_name);
    return storage.ready.then((e) => e ? storage.setItem(key, value) : null);
  }

  static Future<List<News>> getListNews(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/models.json");
    return converterJsonToListNews(jsonDecode(data));
  }

  static News converterJsonToNews(dynamic json){
    return News.fromJson(json);
  }

  static List<News> converterJsonToListNews(dynamic json){
    return (json as List<dynamic>).map((e) => converterJsonToNews(e)).toList();
  }

  // static Future<void> addListNews(News workout) async{
  //   List<News>? list = await getListNews();
  //   list.add(workout);
  //   return setValue("listNews", jsonEncode(list));
  // }
  //
  // static Future<void> removeListNews(News news) async {
  //   List<News>? list = await getListNews();
  //   list.remove(news);
  //   return setValue("listNews", jsonEncode(list));
  // }

  // static Future<void> setListNews(int id, News news) async {
  //   List<News>? list = await getListNews();
  //   list[id] = news;
  //   return setValue("listNews", jsonEncode(list));
  // }
}