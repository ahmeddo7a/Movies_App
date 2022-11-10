import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/movies_module/domain/entities/movie.dart';
import 'package:movies_app/features/movies_module/domain/repository/base_movies_repository.dart';

class SearchMoviesUseCase extends BaseUseCase<List<Movies>, SearchParameters> {
  BaseMoviesRepository baseMoviesRepository;

  SearchMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(
      SearchParameters parameters) async {
    return await baseMoviesRepository.searchMovies(parameters);
  }
}

class SearchParameters extends Equatable {
  final String name;
  final int currentIndex;

  const SearchParameters({required this.name, required this.currentIndex});

  @override
  List<Object?> get props => [name, currentIndex];
}
