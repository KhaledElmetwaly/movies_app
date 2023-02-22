import 'package:clean_arch2/core/errors/exceptions.dart';
import 'package:clean_arch2/core/utils/constants.dart';
import 'package:clean_arch2/data/models/movie_details.dart';
import 'package:clean_arch2/data/models/recommendation.dart';
import 'package:clean_arch2/domain/entities/recommendations.dart';
import 'package:clean_arch2/domain/usecases/get_movie_details.dart';
import 'package:dio/dio.dart';

import '../../core/network/error_message_model.dart';
import '../../domain/usecases/get_movies_recommendation.dart';
import '../models/movies.dart';

abstract class BaseMoviesRemoteDatasource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularNowMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<List<MoviesRecommendation>> getMoviesRecommendation(
      RecommendationParameters parameter);
  Future<MovieDetailsModel> getMovieDetails(MovieParameters parameters);
}

class MoviesRemoteDatasource extends BaseMoviesRemoteDatasource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstants.nowPlayingMovies);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularNowMovies() async {
    final response = await Dio().get(AppConstants.popularMovies);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstants.topRatedMovies);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieParameters parameters) async {
    final response =
        await Dio().get(AppConstants.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesRecommendation>> getMoviesRecommendation(
      RecommendationParameters parameter) async {
    final response =
        await Dio().get(AppConstants.recommendationPath(parameter.id));
    if (response.statusCode == 200) {
      return List<MoviesRecommendationModel>.from(
          (response.data["results"] as List).map(
        (e) => MoviesRecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
