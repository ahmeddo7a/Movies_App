import 'package:equatable/equatable.dart';

import '../../../../../core/enum.dart';
import '../../../domain/entities/movie.dart';

class SearchMoviesState extends Equatable {
  final List<Movies> searchMovies;
  final RequestState searchMoviesState;
  final String searchMoviesMessage;

  const SearchMoviesState(
      {this.searchMovies = const [],
        this.searchMoviesState = RequestState.loading,
        this.searchMoviesMessage = ''});

  SearchMoviesState copyWith({
    List<Movies>? searchMovies,
    RequestState? searchMoviesState,
    String? searchMoviesMessage,
  }) {
    return SearchMoviesState(
        searchMovies: searchMovies ?? this.searchMovies,
        searchMoviesMessage:
        searchMoviesMessage ?? this.searchMoviesMessage,
        searchMoviesState: searchMoviesState ?? this.searchMoviesState);
  }

  @override
  List<Object> get props => [
    searchMovies,
    searchMoviesMessage,
    searchMoviesState,
  ];
}