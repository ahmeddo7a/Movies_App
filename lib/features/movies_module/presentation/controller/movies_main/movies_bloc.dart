import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/core/enum.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_popular_movies_usecase.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_top_rated_movies_usecase.dart';
import 'package:movies_app/features/movies_module/presentation/controller/movies_main/movies_event.dart';
import 'package:movies_app/features/movies_module/presentation/controller/movies_main/movies_states.dart';
import '../../../domain/use_case/get_trending_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetTrendingMoviesUseCase getTrendingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getTrendingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesStates()) {
    on<GetTrendingMoviesEvent>(_getTrendingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getTrendingMovies(
      GetTrendingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getTrendingMoviesUseCase(const NoParameters());
    result.fold(
        (l) => (emit(state.copyWith(
            trendingMoviesState: RequestState.error,
            trendingMessage: l.message))), (r) {
      r.removeWhere((element) => element.image == null);
      emit(state.copyWith(
          trendingMovies: r, trendingMoviesState: RequestState.loaded));
    });
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());

    result.fold(
        (l) => (emit(state.copyWith(
            popularMoviesState: RequestState.error,
            popularMessage: l.message))), (r) {
      r.removeWhere((element) => element.image == null);
      emit(state.copyWith(
          popularMovies: r, popularMoviesState: RequestState.loaded));
    });
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
        (l) => (emit(state.copyWith(
            topRatedMoviesState: RequestState.error,
            topRatedMessage: l.message))), (r) {
      r.removeWhere((element) => element.image == null);
      emit(state.copyWith(
          topRatedMovies: r, topRatedMoviesState: RequestState.loaded));
    });
  }
}
