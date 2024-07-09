import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:movie_app/model/actor_model.dart';
import 'package:movie_app/model/movie_model.dart';

class ApiServices {
  final apiKey = 'api_key=ce6ab78f71cbebfb39e13333eedcd31a';
  final popularMovies = 'https://api.themoviedb.org/3/movie/popular?';
  final nowPlaying = "https://api.themoviedb.org/3/movie/now_playing?";
  final topRateMovies = "https://api.themoviedb.org/3/movie/top_rated?";
  final upComingMovies = "https://api.themoviedb.org/3/movie/upcoming?";
  final movieData = "https://api.themoviedb.org/3/movie/";
  final cast = "https://api.themoviedb.org/3/movie/";

  Future<List<MovieModel>> getPopularMovies() async {
    final response = await http.get(Uri.parse('$popularMovies$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> result = body['results'];
      List<MovieModel> movies = result
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList();

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
  Future<List<MovieModel>> getTopRateMovies() async {
    final response = await http.get(Uri.parse('$topRateMovies$apiKey'));
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

  Future<List<MovieModel>> getUpComingMovies() async {
    final response = await http.get(Uri.parse('$upComingMovies$apiKey'));
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


  Future<MovieModel?> getMovieDetails(int id) async {
    final response = await http.get(Uri.parse('$movieData$id?$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      MovieModel movie = MovieModel.fromJson(body);

      return movie;
    } else {
      Logger().e('Error -${response.statusCode}');
      return null;
    }
  }

  Future<List<ActorModel>> getCast(int id) async {
    final response = await http.get(Uri.parse('$cast$id/credits?$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> cast = body['cast'];
      List<ActorModel> actors = cast
          .map((e) => ActorModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return actors;
    } else {
      Logger().e('Error -${response.statusCode}');
      return [];
    }
  }


}
