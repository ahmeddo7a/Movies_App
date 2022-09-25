import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movies_module/domain/entities/genres.dart';
import 'package:movies_app/features/movies_module/domain/entities/movie.dart';
import 'package:movies_app/features/movies_module/domain/entities/movie_details.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_all_popular_movies_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_movies_details_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_recommendation_use_case.dart';
import '../../../../core/error/failure.dart';
import '../entities/recommendation.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure,List<Movies>>> getTrendingMovies();
  Future<Either<Failure,List<Movies>>> getPopularMovies();
  Future<Either<Failure,List<Movies>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure,List<Recommendation>>> getRecommendation(RecommendationParameters parameters);
  Future<Either<Failure,List<Movies>>> getAllPopularMovies(CurrentIndexParameters parameters);
  Future<Either<Failure,List<Movies>>> getAllTopRatedMovies(CurrentIndexParameters parameters);
  Future<Either<Failure,List<Genres>>> getGenres();



}