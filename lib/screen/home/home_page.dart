import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/screen/home/widget/popular_slider.dart';
import 'package:movie_app/service/api_services.dart';

import 'widget/custom_tool_bar.dart';
import 'widget/movie_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomToolBar(),
                const SizedBox(
                  height: 10,
                ),
                PopularSlider(size: size),
                const SizedBox (
                  height: 10,
                ),
                MoviesListView(size: size,title: "Now Playing",future: ApiServices().getNowPlayingMovies(),),
                MoviesListView(size: size,title: "Top Rated Movies",future: ApiServices().getTopRateMovies(),),
                MoviesListView(size: size,title: "UpComing Movies",future: ApiServices().getUpComingMovies(),),



              ],
            ),
          ),
        ),
      ),
    );
  }
}

