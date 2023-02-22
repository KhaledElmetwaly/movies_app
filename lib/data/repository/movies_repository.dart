import 'package:clean_arch2/data/data_source/movies_remote_datasource.dart';
import 'package:clean_arch2/domain/entities/movie_details.dart';
import 'package:clean_arch2/domain/entities/movies.dart';
import 'package:clean_arch2/domain/entities/recommendations.dart';
import 'package:clean_arch2/domain/repository/base_movies_repository.dart';
import 'package:clean_arch2/domain/usecases/get_movie_details.dart';
import 'package:clean_arch2/domain/usecases/get_movies_recommendation.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failure.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDatasource baseMoviesRemoteDatasource;

  MoviesRepository(this.baseMoviesRemoteDatasource);
  @override
  Future<Either<Failure, List<Movies>>> getNowPlayMovies() async {
    final result = await baseMoviesRemoteDatasource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDatasource.getPopularNowMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final result = await baseMoviesRemoteDatasource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieParameters parameters) async {
    final result = await baseMoviesRemoteDatasource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesRecommendation>>> getMoviesRecommentation(
      RecommendationParameters parameters) async {
    final result =
        await baseMoviesRemoteDatasource.getMoviesRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
