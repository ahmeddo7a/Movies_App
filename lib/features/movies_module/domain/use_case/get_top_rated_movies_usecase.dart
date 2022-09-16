import 'package:dartz/dartz.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/features/movies_module/domain/entities/movie.dart';
import 'package:movies_app/features/movies_module/domain/repository/base_movies_repository.dart';

import '../../../../core/error/failure.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}