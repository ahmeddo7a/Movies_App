import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies_module/domain/use_case/search_movies_use_case.dart';
import 'package:movies_app/features/movies_module/presentation/controller/search/search_movies_event.dart';
import 'package:movies_app/features/movies_module/presentation/controller/search/search_movies_state.dart';

import '../../../../../core/enum.dart';

class SearchMovieBloc extends Bloc<SearchMoviesEvent,SearchMoviesState>{
  final SearchMoviesUseCase searchMoviesUseCase;
  SearchMovieBloc(this.searchMoviesUseCase):super(const SearchMoviesState()){
    on<GetAllSearchMoviesEvent>(_getSearchMovies);
  }

  int searchCurrentPage = 1;
  //var searchMovies =<Movies>[];

  FutureOr<void> _getSearchMovies(GetAllSearchMoviesEvent event, Emitter<SearchMoviesState> emit) async{
    emit(state.copyWith(searchMoviesState: RequestState.loading));
    if(event.name.isEmpty){
      emit(state.copyWith(searchMoviesState: RequestState.loading));

    }else {
      final result = await searchMoviesUseCase(
          SearchParameters(name: event.name, currentIndex: searchCurrentPage));
      result.fold((l) =>
      (emit(state.copyWith(
          searchMoviesState: RequestState.error,
          searchMoviesMessage: l.message))),
              (r) {
            r.removeWhere((element) => element.image == null);
            //searchCurrentPage++;
            //searchMovies.addAll(r);
            emit(state.copyWith(
                searchMoviesState: RequestState.loaded,
                searchMovies: r
            ));
          }
      );
    }
  }
}