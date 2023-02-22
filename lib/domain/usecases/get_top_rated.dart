// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_arch2/core/usecases/base_usecase.dart';
import 'package:clean_arch2/domain/entities/movies.dart';
import 'package:clean_arch2/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

class GetTopRatedNowMoviesUseCase
    extends BaseUsecase<List<Movies>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedNowMoviesUseCase(
    this.baseMoviesRepository,
  );

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters noParameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
