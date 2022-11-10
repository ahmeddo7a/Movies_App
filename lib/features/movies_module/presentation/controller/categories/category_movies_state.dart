import 'package:equatable/equatable.dart';

import '../../../../../core/enum.dart';
import '../../../domain/entities/movie.dart';

class CategoryMoviesState extends Equatable {
  final List<Movies> categoryMovies;
  final RequestState categoryMoviesState;
  final String categoryMoviesMessage;

  const CategoryMoviesState(
      {this.categoryMovies = const [],
      this.categoryMoviesState = RequestState.loading,
      this.categoryMoviesMessage = ''});

  CategoryMoviesState copyWith({
    List<Movies>? categoryMovies,
    RequestState? categoryMoviesState,
    String? categoryMoviesMessage,
  }) {
    return CategoryMoviesState(
        categoryMovies: categoryMovies ?? this.categoryMovies,
        categoryMoviesMessage:
            categoryMoviesMessage ?? this.categoryMoviesMessage,
        categoryMoviesState: categoryMoviesState ?? this.categoryMoviesState);
  }

  @override
  List<Object> get props => [
        categoryMovies,
        categoryMoviesMessage,
        categoryMoviesState,
      ];
}
