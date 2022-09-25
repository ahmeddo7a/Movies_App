import 'package:equatable/equatable.dart';
import 'package:movies_app/features/movies_module/domain/entities/genres.dart';



class MovieDetails extends Equatable{

  final int id;
  final String image;
  final String overView;
  final String releaseDate;
  final double voteAverage;
  final int runTime;
  final String title;
  final List<Genres> genres;

  const MovieDetails({
    required this.id,
    required this.image,
    required this.overView,
    required this.releaseDate,
    required this.voteAverage,
    required this.runTime,
    required this.title,
    required this.genres
});



  @override
  List<Object?> get props => [
    id,
    image,
    overView,
    releaseDate,
    voteAverage,
    runTime,
    title,
    genres
  ];

}

