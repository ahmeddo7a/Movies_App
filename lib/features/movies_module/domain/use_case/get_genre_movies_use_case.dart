import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/features/movies_module/domain/entities/movie.dart';
import 'package:movies_app/features/movies_module/domain/repository/base_movies_repository.dart';

class GetGenreMoviesUseCase extends BaseUseCase<List<Movies>,GenresMoviesParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetGenreMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(GenresMoviesParameters parameters) async{
    return await baseMoviesRepository.getGenreMovies(parameters);
  }


}

class GenresMoviesParameters extends Equatable{
  final int genreId;
  final int currentIndex;
  const GenresMoviesParameters({required this.genreId,required this.currentIndex});
  @override
  List<Object?> get props => [genreId,currentIndex];
}