import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/movies_module/domain/entities/movie.dart';
import 'package:movies_app/features/movies_module/domain/repository/base_movies_repository.dart';

class GetAllPopularMoviesUseCase
    extends BaseUseCase<List<Movies>, CurrentIndexParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetAllPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(CurrentIndexParameters parameters) async {
    return await baseMoviesRepository.getAllPopularMovies(parameters);
  }

}

class CurrentIndexParameters extends Equatable {
  final int currentIndex;
  final bool isRefresh;

  const CurrentIndexParameters({required this.currentIndex, this.isRefresh = false});

  @override
  List<Object> get props => [currentIndex,isRefresh];
}