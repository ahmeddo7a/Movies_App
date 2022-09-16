import 'package:movies_app/features/movies_module/domain/entities/movie.dart';

class MoviesModel extends Movies{
  const MoviesModel({
      required super.id,
      required super.name,
      super.image,
      required super.overView,
      required super.voteAverage,
      required super.releaseDate
  });
  factory MoviesModel.fromJson(Map<String,dynamic> json) => MoviesModel(
      id: json['id'],
      name: json['title'],
      image: json['backdrop_path'],
      overView: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date']
  );


}

