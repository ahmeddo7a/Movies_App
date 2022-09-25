import 'package:equatable/equatable.dart';

class Movies extends Equatable{
  final int id;
  final String name;
  final String? image;
  final String overView;
  final double voteAverage;
  final String releaseDate;

  const Movies({
    required this.id,
    required this.name,
    this.image,
    required this.overView,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    overView,
    voteAverage,
    releaseDate,
  ];
}