import 'package:flutter/material.dart';

class PopularViewModel with ChangeNotifier {
  int? id;
  String? original_title;
  String? overview;
  String? poster_path;
  String? backdrop_path;
  String? release_date;

  PopularViewModel(
      {this.id,
      this.original_title,
      this.overview,
      this.poster_path,
      this.backdrop_path,
      this.release_date});

  PopularViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    original_title = json['original_title'];
    overview = json['overview'];
    poster_path = json['poster_path'];
    backdrop_path = json['backdrop_path'];
    release_date = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['original_title'] = original_title;
    data['overview'] = overview;
    data['poster_path'] = poster_path;
    data['backdrop_path'] = backdrop_path;
    data['release_date'] = release_date;

    return data;
  }
}
