import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/enum.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/use_case/get_all_popular_movies_use_case.dart';
import '../../../domain/use_case/get_all_top_rated_movies_use_case.dart';

part 'see_all_movies_event.dart';
part 'see_all_movies_state.dart';

class SeeAllMoviesBloc extends Bloc<SeeAllMoviesEvent, SeeAllMoviesState> {
  final GetAllPopularMoviesUseCase getAllPopularMoviesUseCase;
  final GetAllTopRatedMoviesUseCase getAllTopRatedMoviesUseCase;
  SeeAllMoviesBloc(this.getAllPopularMoviesUseCase,this.getAllTopRatedMoviesUseCase) : super(const SeeAllMoviesState()) {
    on<GetAllPopularMoviesEvent>(_getAllPopularMovies);
    on<GetAllTopRatedMoviesEvent>(_getAllTopRatedMovies);
  }
  int popularCurrentPage = 1;
  var popularMovies =<Movies>[];
  int topRatedCurrentPage = 1;
  var topRatedMovies =<Movies>[];



  FutureOr<void> _getAllPopularMovies(GetAllPopularMoviesEvent event, Emitter<SeeAllMoviesState> emit) async{
    emit(state.copyWith(allPopularMoviesState: RequestState.loading));
    final result = await getAllPopularMoviesUseCase(CurrentIndexParameters(currentIndex: popularCurrentPage));
    result.fold((l) => (emit(state.copyWith(
        allPopularMoviesState: RequestState.error,
        allPopularMoviesMessage: l.message))),
            (r) {
          r.removeWhere((element) => element.image == null);
          popularCurrentPage++;
          popularMovies.addAll(r);
          emit(state.copyWith(
              allPopularMoviesState: RequestState.loaded,
              allPopularMovies: popularMovies
          ));

        }
    );
  }

  FutureOr<void> _getAllTopRatedMovies(GetAllTopRatedMoviesEvent event, Emitter<SeeAllMoviesState> emit) async{
    emit(state.copyWith(allTopRatedMoviesState: RequestState.loading));
    final result = await getAllTopRatedMoviesUseCase(CurrentIndexParameters(currentIndex: topRatedCurrentPage));
    result.fold((l) => (emit(state.copyWith(
        allTopRatedMoviesState: RequestState.error,
        allTopRatedMoviesMessage: l.message))),
            (r) {
          r.removeWhere((element) => element.image == null);
          topRatedCurrentPage++;
          topRatedMovies.addAll(r);
          emit(state.copyWith(
              allTopRatedMoviesState: RequestState.loaded,
              allTopRatedMovies: topRatedMovies
          ));
        }
    );
  }
}
