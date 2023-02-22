import 'package:clean_arch2/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movies.dart';

class MoviesStates extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMessage;
  final List<Movies> popularMovies;
  final RequestState popularMoviesState;
  final String popularMessage;
  final List<Movies> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesmessage;
  const MoviesStates({
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMessage = '',
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMoviesmessage = '',
  });
  MoviesStates copyWith({
    List<Movies>? nowPlayingMovies,
    RequestState? nowPlayingMoviesState,
    String? nowPlayingMessage,
    List<Movies>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMessage,
    List<Movies>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMoviesmessage,
  }) {
    return MoviesStates(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingMoviesState:
            nowPlayingMoviesState ?? this.nowPlayingMoviesState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularMoviesState: popularMoviesState ?? this.popularMoviesState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
        topRatedMoviesmessage:
            topRatedMoviesmessage ?? this.topRatedMoviesmessage);
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMessage,
        popularMessage,
        popularMovies,
        popularMoviesState,
        topRatedMovies,
        topRatedMoviesState,
        topRatedMoviesmessage
      ];
}
