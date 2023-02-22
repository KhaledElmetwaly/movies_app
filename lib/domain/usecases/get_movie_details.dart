// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_arch2/core/errors/failure.dart';
import 'package:clean_arch2/core/usecases/base_usecase.dart';
import 'package:clean_arch2/domain/entities/movie_details.dart';
import 'package:clean_arch2/domain/repository/base_movies_repository.dart';

class MovieDetailsUsecase extends BaseUsecase<MovieDetails, MovieParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  MovieDetailsUsecase(
    this.baseMoviesRepository,
  );
  @override
  Future<Either<Failure, MovieDetails>> call(MovieParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieParameters extends Equatable {
  final int movieId;
  const MovieParameters({
    required this.movieId,
  });

  @override
  List<Object?> get props => [movieId];
}
