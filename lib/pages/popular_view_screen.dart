import 'package:flutter/material.dart';
import 'package:movie_app/data_resources/api_services.dart';
import 'package:movie_app/model/popular_view_model.dart';
import 'package:movie_app/pages/detail_screen.dart';
import 'package:provider/provider.dart';

class PopularViewScreen extends StatefulWidget {
  const PopularViewScreen({Key? key}) : super(key: key);

  @override
  State<PopularViewScreen> createState() => _PopularViewScreenState();
}

class _PopularViewScreenState extends State<PopularViewScreen> {
  @override
  Widget build(BuildContext context) {
    var popularList = Provider.of<List<PopularViewModel>>(context);
    return Container(
      child: popularList != null ? GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.62,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 30),
        itemCount: popularList.length,
        itemBuilder: (context, index) {
          return _itemPopular(popularList[index]);
        },
      ) : Center(child: CircularProgressIndicator()),
    );
  }

  _itemPopular(PopularViewModel data) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(
            builder: (context) => DeTailScreen(itemPopular: data));
        Navigator.push(context, route);
      },
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              alignment: const Alignment(0.7, 0.95),
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${data.poster_path}"))),
                ),
                Text(
                  data.release_date!,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                data.original_title!,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
