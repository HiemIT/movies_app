class ApiUrls {
  /* static const String baseUrl = 'http://api.zmax.vn/api/videos';*/
  // final Uri popularListApiUrl = Uri.parse(
  //     'https://api.themoviedb.org/3/movie/popular?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN');

  String BASE_URL =
      "https://api.themoviedb.org/3/movie/popular?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN";

  String castListApiUrl({required String id}) =>
      "https://api.themoviedb.org/3/movie/$id/credits?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN";
}
