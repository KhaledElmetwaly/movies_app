// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MoviesRecommendation extends Equatable {
  final String? backdropPath;
  final int id;
  const MoviesRecommendation({this.backdropPath, required this.id});

  @override
  List<Object?> get props => [backdropPath, id];
}
