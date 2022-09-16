part of 'see_all_movies_bloc.dart';

abstract class SeeAllMoviesEvent extends Equatable {
  const SeeAllMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetAllPopularMoviesEvent extends SeeAllMoviesEvent {}
class GetAllTopRatedMoviesEvent extends SeeAllMoviesEvent {}

