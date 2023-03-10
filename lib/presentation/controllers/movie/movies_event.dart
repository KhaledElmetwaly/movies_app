import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {}

class GetPopularNowMoviesEvent extends MoviesEvent {}

class GetTopRatedMoviesEvent extends MoviesEvent {}
