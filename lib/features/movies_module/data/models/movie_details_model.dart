import 'package:movies_app/features/movies_module/data/models/genres_model.dart';
import 'package:movies_app/features/movies_module/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({required super.id,
    required super.image,
    required super.overView,
    required super.releaseDate,
    required super.voteAverage,
    required super.runTime,
    required super.title,
    required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          id: json['id'],
          image: json['backdrop_path'],
          overView: json['overview'],
          releaseDate: json['release_date'],
          voteAverage: json['vote_average'].toDouble(),
          runTime: json['runtime'],
          title: json['title'],
          genres: List<GenresModel>.from(
              json['genres'].map((x)=>GenresModel.fromJson(x))),

  );
}
