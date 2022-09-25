import 'package:equatable/equatable.dart';

class Genres extends Equatable{
  final String name;
  final int id;

  const Genres({
    required this.id,
    required this.name,
});

  @override
  // TODO: implement props
  List<Object?> get props => [id,name];

}