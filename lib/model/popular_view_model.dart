class PopularViewModel {
  int? id;
  String? original_title;
  String? overview;
  String? poster_path;
  String? backdrop_path;
  String? release_date;

  PopularViewModel(
      this.id,
      this.original_title,
      this.overview,
      this.poster_path,
      this.backdrop_path,
      this.release_date);

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
    data['id'] = this.id;
    data['original_title'] = this.original_title;
    data['overview'] = this.overview;
    data['poster_path'] = this.poster_path;
    data['backdrop_path'] = this.backdrop_path;
    data['release_date'] = this.release_date;

    return data;
  }
}
