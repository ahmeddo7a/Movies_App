import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/movies_module/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/features/movies_module/domain/entities/movie.dart';
import 'package:movies_app/features/movies_module/domain/entities/movie_details.dart';
import 'package:movies_app/features/movies_module/domain/entities/recommendation.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_all_popular_movies_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_genre_movies_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_movies_details_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_recommendation_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/search_movies_use_case.dart';
import '../../domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository{

  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;
  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure,List<Movies>>> getPopularMovies() async{
    final result =  await baseMoviesRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movies>>> getTopRatedMovies() async{
    final result =  await baseMoviesRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movies>>> getTrendingMovies() async{
    final result =  await baseMoviesRemoteDataSource.getTrendingMovies();
    try {
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result =  await baseMoviesRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
    final result =  await baseMoviesRemoteDataSource.getRecommendationMovies(parameters);
    try {
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllPopularMovies(CurrentIndexParameters parameters) async{
    final result =  await baseMoviesRemoteDataSource.getAllPopularMovies(parameters);
    try {
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getAllTopRatedMovies(CurrentIndexParameters parameters) async{
    final result =  await baseMoviesRemoteDataSource.getAllTopRatedMovies(parameters);
    try {
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getGenreMovies(GenresMoviesParameters parameters) async{
    final result =  await baseMoviesRemoteDataSource.getGenreMovies(parameters);
    try {
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> searchMovies(SearchParameters parameters) async{
    final result =  await baseMoviesRemoteDataSource.searchMovies(parameters);
    try {
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }


}