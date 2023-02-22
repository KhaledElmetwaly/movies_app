import 'package:clean_arch2/data/data_source/movies_remote_datasource.dart';
import 'package:clean_arch2/data/repository/movies_repository.dart';
import 'package:clean_arch2/domain/repository/base_movies_repository.dart';
import 'package:clean_arch2/domain/usecases/get_movie_details.dart';
import 'package:clean_arch2/domain/usecases/get_now_playing.dart';
import 'package:clean_arch2/domain/usecases/get_popular_movies.dart';
import 'package:clean_arch2/domain/usecases/get_top_rated.dart';
import 'package:get_it/get_it.dart';

import '../../domain/usecases/get_movies_recommendation.dart';
import '../../presentation/controllers/movie/movies_bloc.dart';
import '../../presentation/controllers/movie_details/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // BLOC
    sl.registerLazySingleton(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerLazySingleton(() => MovieDetailsBloc(sl(), sl()));
    // USECASE
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularNowMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedNowMoviesUseCase(sl()));
    sl.registerLazySingleton(() => MovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetMoviesRecommendationUsecase(sl()));
    // REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
    // DATASOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDatasource>(
        () => MoviesRemoteDatasource());
  }
}
