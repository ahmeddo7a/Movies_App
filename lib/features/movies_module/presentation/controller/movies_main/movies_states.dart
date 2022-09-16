import 'package:equatable/equatable.dart';
import 'package:movies_app/core/enum.dart';

import '../../../domain/entities/movie.dart';

class MoviesStates extends Equatable{

  final List<Movies> trendingMovies;
  final RequestState trendingMoviesState;
  final String trendingMessage;
  final List<Movies> popularMovies;
  final RequestState popularMoviesState;
  final String popularMessage;
  final List<Movies> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMessage;


  const MoviesStates({
    this.trendingMovies= const [],
    this.trendingMoviesState=RequestState.loading,
    this.trendingMessage = '',
    this.popularMovies= const [],
    this.popularMoviesState=RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovies= const [],
    this.topRatedMoviesState=RequestState.loading,
    this.topRatedMessage = '',
  });

  MoviesStates copyWith({
     List<Movies>? trendingMovies,
     RequestState? trendingMoviesState,
     String? trendingMessage,
     List<Movies>? popularMovies,
     RequestState? popularMoviesState,
     String? popularMessage,
     List<Movies>? topRatedMovies,
     RequestState? topRatedMoviesState,
     String? topRatedMessage,
  }){
    return MoviesStates(
      trendingMovies: trendingMovies ?? this.trendingMovies,
      trendingMoviesState: trendingMoviesState ?? this.trendingMoviesState,
      trendingMessage: trendingMessage ?? this.trendingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
}

  @override
  List<Object?> get props => [
    trendingMovies,
    trendingMoviesState,
    trendingMessage,
    popularMovies,
    popularMoviesState,
    popularMessage,
    topRatedMovies,
    topRatedMoviesState,
    topRatedMessage,
  ];
}