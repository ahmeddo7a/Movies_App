import 'package:get_it/get_it.dart';
import 'package:movies_app/features/movies_module/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/features/movies_module/data/repository/movies_repository.dart';
import 'package:movies_app/features/movies_module/domain/repository/base_movies_repository.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_all_popular_movies_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_all_top_rated_movies_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_genres_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_movies_details_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_popular_movies_usecase.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_recommendation_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_top_rated_movies_usecase.dart';
import 'package:movies_app/features/movies_module/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_app/features/movies_module/presentation/controller/movies_main/movies_bloc.dart';
import 'package:movies_app/features/movies_module/presentation/controller/popular_movies/see_all_movies_bloc.dart';
import '../../features/movies_module/domain/use_case/get_trending_movies_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///Movies BLoC
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
    sl.registerFactory(() => SeeAllMoviesBloc(sl(),sl()));

    ///UseCase
    sl.registerLazySingleton(() => GetTrendingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => GetAllPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetGenresUseCase(sl()));



    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    ///DataSource
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());
  }
}
