import 'package:logger/logger.dart';

import 'company_model.dart';

class MovieModel {
  String title;
  String overview;
  String backdropPath;
  String posterPath;
  double voteAverage;
  int id;
  bool isAdult;
  String releaseDate;
  String? tagline;
  List<CompanyModel>? compaines;

  MovieModel({required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
    required this.id,
    required this.isAdult,
    required this.releaseDate,
    this.tagline,
    this.compaines
  });

  factory MovieModel.fromJson(Map<String, dynamic> json){

    List<CompanyModel>? compaines = json['production_companies'] != null
        ? (json['production_companies'] as List<dynamic>).map((company) =>
        CompanyModel.fromJson(company as Map<String, dynamic>)).toList():null;



    return MovieModel(
      title: json['title'],
      overview: json['overview'],
      backdropPath: "https://image.tmdb.org/t/p/w500${json['backdrop_path']}",
      posterPath: "https://image.tmdb.org/t/p/w500${json['poster_path']}",
      voteAverage: json['vote_average'],
      id: json['id'],
      isAdult: json['adult'],
      tagline: json['tagline'],
      releaseDate: json['release_date'],
      compaines: compaines
    );
  }
}
