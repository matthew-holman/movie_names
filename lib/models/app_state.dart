import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'movie_name_generator.dart';

class MyAppState extends ChangeNotifier {
  var current = MovieNameGenerator.generateMovieName();
  var favorites = <String>[];

  void getNext() {
    current = MovieNameGenerator.generateMovieName();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}