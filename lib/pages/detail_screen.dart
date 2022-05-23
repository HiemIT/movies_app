import 'package:flutter/material.dart';
import 'package:movie_app/data_resources/api_services.dart';
import 'package:movie_app/model/item_cast_model.dart';
import 'package:movie_app/model/popular_view_model.dart';

class DeTailScreen extends StatelessWidget {
  final PopularViewModel itemPopular;

  const DeTailScreen({Key? key, required this.itemPopular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  print('Favorite');
                },
              ),
            ),
          ]),
      body: Stack(
        children: [
          Image.network(
              "https://image.tmdb.org/t/p/original${itemPopular.poster_path}",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height),
          Container(
            color: Colors.white.withOpacity(0.8),
          ),
          _body(context, itemPopular: itemPopular),
        ],
      ),
    );
  }

  _body(BuildContext context, {required PopularViewModel itemPopular}) {
    return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          _header(itemPopular),
          const SizedBox(height: 20),
          _cast(id: itemPopular.id!),
          const SizedBox(height: 20),
          _overview(overview: itemPopular.overview!),
        ]);
  }

  _header(PopularViewModel itemPopular) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                    "https://image.tmdb.org/t/p/original${itemPopular.backdrop_path}",
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemPopular.original_title ?? 'No title',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Text(
                            "Xuất chiếu: ",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            '${itemPopular.release_date}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Text(
                            "Thể loại: ",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            '${itemPopular.original_title}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  // _cast(PopularViewModel itemPopular) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 25),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           "Cast",
  //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Container(
  //           height: 200,
  //           child: FutureBuilder(
  //             future: ApiServices().getCastList(id: itemPopular.id.toString()),
  //             builder: (context, snapshot) {
  //               if ((snapshot.hasError) || (!snapshot.hasData)) {
  //                 return Container(
  //                   child: Text("Loading..."),
  //                 );
  //               }
  //               List<PopularViewModel> castItemList = snapshot.data;
  //               return ListView.builder(
  //                 shrinkWrap: true,
  //                 physics: ClampingScrollPhysics(),
  //                 itemCount: castItemList.length,
  //                 scrollDirection: Axis.horizontal,
  //                 itemBuilder: (context, index) {
  //                   return _itemCast(castItemList[index]);
  //                 },
  //               );
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _cast({required int id}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Casts",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: FutureBuilder(
              future: ApiServices().getCastList(id: itemPopular.id.toString()),
              builder: (context, snapshot) {
                if ((snapshot.hasError) || (!snapshot.hasData)) {
                  return Container(
                    child: const Text("Loading..."),
                  );
                }
                List<ItemCast> castItemList = snapshot.data as List<ItemCast>;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: castItemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _itemCast(castItemList[index]);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _itemCast(ItemCast castItemList) {
    return Container(
      margin: const EdgeInsets.only(right: 18),
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${castItemList.profile_path}"))),
          ),
          const SizedBox(
            height: 5,
          ),
           Text(
            /*itemCast.name*/
            "${castItemList.name}",
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Actor",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11),
          )
        ],
      ),
    );
  }

  _overview({required String overview}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overview",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "$overview",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
