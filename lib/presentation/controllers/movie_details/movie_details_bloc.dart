import 'dart:async';

import 'package:clean_arch2/core/utils/enums.dart';
import 'package:clean_arch2/domain/entities/movie_details.dart';
import 'package:clean_arch2/domain/entities/recommendations.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_movie_details.dart';
import '../../../domain/usecases/get_movies_recommendation.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
      this.movieDetailsUsecase, this.getMoviesRecommendationUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMoviesRecommendationEvent>(_getMovieRecommendation);
  }
  final MovieDetailsUsecase movieDetailsUsecase;
  final GetMoviesRecommendationUsecase getMoviesRecommendationUsecase;
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await movieDetailsUsecase(MovieParameters(movieId: event.id));
    result.fold(
      (l) => emit(state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: l.message)),
      (r) => emit(
        state.copyWith(movieDetail: r, movieDetailsState: RequestState.loaded),
      ),
    );
  }

  FutureOr<void> _getMovieRecommendation(GetMoviesRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getMoviesRecommendationUsecase(
        RecommendationParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationState: RequestState.error,
            recommendationMessage: l.message)),
        (r) => emit(state.copyWith(
              recommendation: r,
              recommendationState: RequestState.loaded,
            )));
  }
}
