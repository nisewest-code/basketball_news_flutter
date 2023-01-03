import 'package:flutter/material.dart';

import '../utils/storage.dart';
import 'news.dart';

class Data with ChangeNotifier {
  List<News>? listNews;

  Data(){
    _init();

  }
  void _init() async {
    // listNews = await Storage.getListNews();
    notifyListeners();
  }

  void addWorkout(News news){
    listNews?.add(news);
    notifyListeners();
  }
}