import 'package:clean_arch2/core/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/movies.dart';
import '../repository/base_movies_repository.dart';

class GetPopularNowMoviesUseCase
    extends BaseUsecase<List<Movies>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularNowMoviesUseCase(
    this.baseMoviesRepository,
  );

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters noParameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
