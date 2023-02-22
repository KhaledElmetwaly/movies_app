import 'package:clean_arch2/domain/entities/movie_details.dart';
import 'package:clean_arch2/domain/entities/recommendations.dart';
import 'package:clean_arch2/domain/usecases/get_movie_details.dart';
import 'package:clean_arch2/domain/usecases/get_movies_recommendation.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/movies.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayMovies();
  Future<Either<Failure, List<Movies>>> getPopularMovies();
  Future<Either<Failure, List<Movies>>> getTopRatedMovies();
  Future<Either<Failure, List<MoviesRecommendation>>> getMoviesRecommentation(
      RecommendationParameters parameters);
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieParameters parameters);
}
