import '../../domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel(
      {required super.id,
      required super.title,
      required super.genreIds,
      required super.backdropPath,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});
  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
      id: json['id'],
      title: json['title'],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date']);
}
