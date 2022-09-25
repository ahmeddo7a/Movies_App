import 'package:equatable/equatable.dart';

class GenresMovies extends Equatable{
  final String name;
  final int id;
  final String image;


  const GenresMovies({
    required this.id,
    required this.name,
    required this.image
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,image];

}