import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/service/api_services.dart';

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
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                    const Spacer(),
                    const Text(
                      "Movie Hub",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: ApiServices().getPopularMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    }
                    List<MovieModel> movies = snapshot.data!;
                    return CarouselSlider(
                      options: CarouselOptions(
                          height: size.height * 0.22, autoPlay: true),
                      items: snapshot.data!.map((movie) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(movie.backdropPath),
                                        fit: BoxFit.cover)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 3,
                                      bottom: 3,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Text(
                                          movie.title,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),

                                    ),
                                    Positioned(
                                      top: 3,
                                      right: 3,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.deepOrange.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              movie.voteAverage.toString().substring(0,3),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(width: 5,),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow.shade600,
                                              size: 12,
                                            )
                                          ],
                                        ),
                                      ),

                                    ),

                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
