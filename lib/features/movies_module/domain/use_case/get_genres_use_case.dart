import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movies_module/domain/entities/genres.dart';

import '../../../../core/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_movies_repository.dart';

class GetGenresUseCase extends BaseUseCase<List<Genres>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository ;

  GetGenresUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Genres>>> call(NoParameters parameters) async{
    return await baseMoviesRepository.getGenres();
  }

}