import 'package:movie_app/data_resources/repository/repository.dart';
import 'package:rxdart/subjects.dart';

import '../model/popular_view_model.dart';

class PopularBloc {
  final _repository = Repository();

//  Tạo stream, sử dụng PublishSubject
  final popularSubject = PublishSubject<List<PopularViewModel>>();

//  Nhúng stream vào stream controller
  fetchAllPopulars() async {
    List<PopularViewModel>? popularList = await _repository.fetchAllPopular();
    popularSubject.sink.add(popularList!);
  }
  Stream<List<PopularViewModel>> get allPopular => popularSubject.stream;
//  dispose
  dispose() {
    popularSubject.close();
  }
}
