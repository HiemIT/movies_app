import 'package:flutter/material.dart';
import 'package:movie_app/pages/popular_view_screen.dart';

import '../data_resources/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      // Do whatever you want based on the tab index
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 0.0,
        bottom: _tabBar(),
      ),
      body: _tabBarView(),
    );
  }

  _tabBar() {
    return TabBar(
      isScrollable: true,
      labelPadding: const EdgeInsets.only(left: 30, right: 30),
      unselectedLabelColor: Colors.grey[400],
      labelColor: Colors.black,
      controller: _controller,
      tabs: const [
        Tab(text: "Popular"),
        Tab(text: "Nowplaying"),
        Tab(text: "Upcoming"),
        Tab(text: "TopRated"),
      ],
    );
  }

  _tabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _controller,
      children: const <Widget>[
        PopularViewScreen(),
        Center(child: Text("2")),
        Center(child: Text("3")),
        Center(child: Text("4")),
      ],
    );
  }
}
