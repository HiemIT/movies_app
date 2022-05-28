import 'package:movie_app/data_resources/api_services.dart';

import '../../model/popular_view_model.dart';

class Repository{
  final ApiServices apiServices = ApiServices();

  Future<List<PopularViewModel>?> fetchAllPopular() => apiServices.fetchPopular();
}