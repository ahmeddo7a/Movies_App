
import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable{

  const MoviesEvents();

  @override
  List<Object> get props =>[];
}

class GetPopularMoviesEvent extends MoviesEvents{}

class GetTopRatedMoviesEvent extends MoviesEvents{}

class GetTrendingMoviesEvent extends MoviesEvents{}