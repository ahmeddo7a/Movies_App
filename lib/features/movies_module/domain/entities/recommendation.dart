import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? image;
  final int id;
  final String title;

  const Recommendation(
      {required this.id, required this.title,  this.image});

  @override
  List<Object?> get props => [image, id, title];
}
