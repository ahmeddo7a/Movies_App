import 'package:equatable/equatable.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();
}

class GetAllSearchMoviesEvent extends SearchMoviesEvent {
  final String name;

  const GetAllSearchMoviesEvent({required this.name});
  @override
  List<Object> get props => [name];
}