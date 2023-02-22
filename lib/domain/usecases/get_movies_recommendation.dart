import 'package:clean_arch2/core/errors/failure.dart';
import 'package:clean_arch2/core/usecases/base_usecase.dart';
import 'package:clean_arch2/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/recommendations.dart';

class GetMoviesRecommendationUsecase
    extends BaseUsecase<List<MoviesRecommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesRecommendationUsecase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<MoviesRecommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getMoviesRecommentation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [id];
}
