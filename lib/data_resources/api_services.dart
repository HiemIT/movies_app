import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:movie_app/data_resources/api_urls.dart';
import 'package:movie_app/model/item_cast_model.dart';
import 'package:movie_app/model/popular_view_model.dart';

class ApiServices {

  String BASE_URL = "https://api.themoviedb.org/3/movie/popular?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN";

  Dio dio = Dio();

  Future<List<PopularViewModel>?> fetchPopular() async {
    try {
      Response response = await dio.get(ApiServices().BASE_URL);
      List<PopularViewModel> popularViewModels = [];
      for (var item in response.data["results"]) {
        popularViewModels.add(PopularViewModel.fromJson(item));
      }
      return popularViewModels;
    } catch (e) {
      return null;
    }
  }

  getCastList({String? id}) async {
    try {
      Response response = await dio.get(ApiUrls().castListApiUrl(id: id!));
      print(response.data["cast"]);
      List<ItemCast> castList  = [];
      for (var item in response.data["cast"]) {
        castList.add(ItemCast.fromJson(item));
      }
      return castList;
    } catch (e) {
      return null;
    }
  }
}
