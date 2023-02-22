import 'package:clean_arch2/domain/entities/recommendations.dart';

class MoviesRecommendationModel extends MoviesRecommendation {
  const MoviesRecommendationModel({super.backdropPath, required super.id});
  factory MoviesRecommendationModel.fromJson(Map<String, dynamic> json) =>
      MoviesRecommendationModel(
          backdropPath:
              json["backdrop_path"] ?? "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
          id: json["id"]);
}
