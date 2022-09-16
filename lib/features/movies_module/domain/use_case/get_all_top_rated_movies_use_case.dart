import 'package:dartz/dartz.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_all_popular_movies_use_case.dart';

import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetAllTopRatedMoviesUseCase extends BaseUseCase<List<Movies>,CurrentIndexParameters>{
  final BaseMoviesRepository baseMoviesRepository ;

  GetAllTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(CurrentIndexParameters parameters) async{
    return await baseMoviesRepository.getAllTopRatedMovies(parameters);
  }

}