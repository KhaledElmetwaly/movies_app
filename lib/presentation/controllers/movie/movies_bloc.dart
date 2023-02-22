import 'dart:async';

import 'package:clean_arch2/core/usecases/base_usecase.dart';
import 'package:clean_arch2/core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_now_playing.dart';
import '../../../domain/usecases/get_popular_movies.dart';
import '../../../domain/usecases/get_top_rated.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  GetPopularNowMoviesUseCase getPopularNowMoviesUseCase;
  GetTopRatedNowMoviesUseCase getTopRatedNowMoviesUseCase;
  MoviesBloc(this.getPopularNowMoviesUseCase, this.getTopRatedNowMoviesUseCase,
      this.getNowPlayingMoviesUsecase)
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularNowMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingMoviesState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingMoviesState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularNowMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getPopularNowMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
          popularMoviesState: RequestState.error, popularMessage: l.message)),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularMoviesState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getTopRatedNowMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
            topRatedMoviesState: RequestState.error,
            topRatedMoviesmessage: l.message),
      ),
      (r) => emit(
        state.copyWith(
            topRatedMovies: r, topRatedMoviesState: RequestState.loaded),
      ),
    );
  }
}
