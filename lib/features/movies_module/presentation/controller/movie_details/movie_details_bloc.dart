import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/enum.dart';
import 'package:movies_app/features/movies_module/domain/entities/movie_details.dart';
import 'package:movies_app/features/movies_module/domain/entities/recommendation.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_movies_details_use_case.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_recommendation_use_case.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.message)), (r) {
      emit(state.copyWith(
          movieDetailsState: RequestState.loaded, movieDetails: r));
    });
  }

  FutureOr<void> _getRecommendation(
      GetRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationState: RequestState.error,
            recommendationMessage: l.message)), (r) {
      r.removeWhere((element) => element.image == null);
      emit(state.copyWith(
          recommendationState: RequestState.loaded, recommendationMovies: r));
    });
  }
}
