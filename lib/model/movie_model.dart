class MovieModel {
  String title;
  String overview;
  String backdropPath;
  String posterPath;

  MovieModel({required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath});

  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(title: json['title'],
        overview: json['overview'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path']
    );
  }
}
