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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: BoxDecoration(
                color: Colors.grey.shade900,
                image: DecorationImage(
                    //   colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
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
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movie.title,
                  style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        fit: BoxFit.cover,
                        widget.movie.posterPath,
                        width: 110,
                        height: 170,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.justify,
                        widget.movie.overview,
                        style:
                            TextStyle(color: Colors.grey.shade400, fontSize: 14,),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
