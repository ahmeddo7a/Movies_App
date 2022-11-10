import 'package:dio/dio.dart';
import 'package:movies_app/core/app_constants.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_model.dart';
import 'package:movies_app/features/movies_module/data/models/movie_details_model.dart';
import 'package:movies_app/features/movies_module/data/models/movies_model.dart';
import 'package:movies_app/features/movies_module/data/models/recommendation_model.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_all_popular_movies_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_genre_movies_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_movies_details_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_recommendation_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/search_movies_use_case.dart';

abstract class BaseMoviesRemoteDataSource{
  Future<List<MoviesModel>> getTrendingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationParameters parameters);
  Future<List<MoviesModel>> getAllPopularMovies(CurrentIndexParameters parameters);
  Future<List<MoviesModel>> getAllTopRatedMovies(CurrentIndexParameters parameters);
  Future<List<MoviesModel>> getGenreMovies(GenresMoviesParameters parameters);
  Future<List<MoviesModel>> searchMovies(SearchParameters parameters);


}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource{
  @override
  Future<List<MoviesModel>> getTrendingMovies() async{
    final response = await Dio().get(AppConstants.trendingMoviesPath);
    if(response.statusCode==200){
      return List<MoviesModel>.from(
          (response.data['results'] as List)
              .map(
                  (e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async{
    final response = await Dio().get(AppConstants.popularMoviesPath);
    if(response.statusCode==200){
      return List<MoviesModel>.from(
        (response.data['results'] as List)
            .map(
                (e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async{
    final response = await Dio().get(AppConstants.topRatedMoviesPath);
    if(response.statusCode==200){
      return List<MoviesModel>.from(
        (response.data['results'] as List)
            .map(
                (e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async{
    final response = await Dio().get(AppConstants.movieDetailsPath(parameters.movieId));
    if(response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationParameters parameters) async{
    final response = await Dio().get(AppConstants.movieRecommendationPath(parameters.id));
    if(response.statusCode==200){
      return List<RecommendationModel>.from(
        (response.data['results'] as List)
            .map(
                (e) => RecommendationModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getAllPopularMovies(CurrentIndexParameters parameters) async{
    final response = await Dio().get(AppConstants.allPopularMoviesPath(parameters.currentIndex));
    if(response.statusCode==200){
      return List<MoviesModel>.from(
        (response.data['results'] as List)
            .map(
                (e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getAllTopRatedMovies(CurrentIndexParameters parameters) async{
    final response = await Dio().get(AppConstants.allTopRatedMoviesPath(parameters.currentIndex));
    if(response.statusCode==200){
      return List<MoviesModel>.from(
        (response.data['results'] as List)
            .map(
                (e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<MoviesModel>> getGenreMovies(GenresMoviesParameters parameters) async{
    final response = await Dio().get(AppConstants.selectedGenres(parameters.genreId,parameters.currentIndex));
    if(response.statusCode==200){
      return List<MoviesModel>.from(
        (response.data['results'] as List)
            .map(
                (e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> searchMovies(SearchParameters parameters) async{
    final response = await Dio().get(AppConstants.searchMoviesPath(parameters.currentIndex,parameters.name));
    if(response.statusCode==200){
      return List<MoviesModel>.from(
        (response.data['results'] as List)
            .map(
                (e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }


}