part of 'see_all_movies_bloc.dart';

class SeeAllMoviesState extends Equatable {
  const SeeAllMoviesState(
      {this.allPopularMovies = const [],
      this.allPopularMoviesState = RequestState.loading,
      this.allPopularMoviesMessage = '',
      this.allTopRatedMovies = const [],
      this.allTopRatedMoviesState = RequestState.loading,
      this.allTopRatedMoviesMessage = ''});

  final List<Movies> allPopularMovies;
  final RequestState allPopularMoviesState;
  final String allPopularMoviesMessage;
  final List<Movies> allTopRatedMovies;
  final RequestState allTopRatedMoviesState;
  final String allTopRatedMoviesMessage;

  SeeAllMoviesState copyWith({
    List<Movies>? allPopularMovies,
    RequestState? allPopularMoviesState,
    String? allPopularMoviesMessage,
    List<Movies>? allTopRatedMovies,
    RequestState? allTopRatedMoviesState,
    String? allTopRatedMoviesMessage,
  }) {
    return SeeAllMoviesState(
      allPopularMovies: allPopularMovies ?? this.allPopularMovies,
      allPopularMoviesState:
          allPopularMoviesState ?? this.allPopularMoviesState,
      allPopularMoviesMessage:
          allPopularMoviesMessage ?? this.allPopularMoviesMessage,
      allTopRatedMovies: allTopRatedMovies ?? this.allTopRatedMovies,
      allTopRatedMoviesState:
          allTopRatedMoviesState ?? this.allTopRatedMoviesState,
      allTopRatedMoviesMessage:
          allTopRatedMoviesMessage ?? this.allTopRatedMoviesMessage,
    );
  }

  @override
  List<Object> get props => [
        allPopularMovies,
        allPopularMoviesState,
        allPopularMoviesMessage,
        allTopRatedMovies,
        allTopRatedMoviesState,
        allTopRatedMoviesMessage,
      ];
}
