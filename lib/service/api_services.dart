import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:movie_app/model/movie_model.dart';

class ApiServices {
  final apiKey = 'api_key=ce6ab78f71cbebfb39e13333eedcd31a';
  final popularMovies = 'https://api.themoviedb.org/3/movie/popular?';
  final nowPlaying = "https://api.themoviedb.org/3/movie/now_playing?";

  Future<List<MovieModel>> getPopularMovies() async {
    final response = await http.get(Uri.parse('$popularMovies$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> result = body['results'];
      List<MovieModel> movies = result
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList();

      Logger().f(movies[0].posterPath);
      return movies;
    } else {
      Logger().e('Error -${response.statusCode}');
      return [];
    }
  }

  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse('$nowPlaying$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body['results'];
      List<MovieModel> movies = results
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return movies;
    } else {
      Logger().e('Error -${response.statusCode}');
      return [];
    }
  }
}
