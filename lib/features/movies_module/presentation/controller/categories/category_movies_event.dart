import 'package:equatable/equatable.dart';

abstract class CategoryMoviesEvent extends Equatable {
  const CategoryMoviesEvent();

}
class GetAllCategoryMoviesEvent extends CategoryMoviesEvent {
  final int id;

  const GetAllCategoryMoviesEvent({required this.id});

  @override
  List<Object> get props => [id];
}
