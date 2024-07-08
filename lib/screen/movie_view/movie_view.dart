import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/model/movie_model.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key, required this.movie});

  final MovieModel movie;

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(children: [
          Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: BoxDecoration(
                color: Colors.grey.shade900,
                image: DecorationImage(
                    image: NetworkImage(widget.movie.backdropPath),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                Positioned(
                    top: 8,
                    left: 8,
                    child: BackButton(

                      color: Colors.white,
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              const Color(0xFF000000).withOpacity(0.5))),
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
