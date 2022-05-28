import 'package:flutter/material.dart';
import 'package:movie_app/blocs/popular_bloc.dart';
import 'package:movie_app/pages/home_screen.dart';
import 'package:provider/provider.dart';

import 'model/popular_view_model.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final popularBloc= PopularBloc();
   MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    popularBloc.fetchAllPopulars();
    return  StreamProvider( create: (context) => popularBloc.allPopular,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Debug Show',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
