import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies_module/domain/use_case/get_genre_movies_use_case.dart';
import 'package:movies_app/features/movies_module/presentation/controller/categories/category_movies_event.dart';
import 'package:movies_app/features/movies_module/presentation/controller/categories/category_movies_state.dart';

import '../../../../../core/enum.dart';
import '../../../domain/entities/movie.dart';

class CategoryMoviesBloc extends Bloc<CategoryMoviesEvent,CategoryMoviesState>{
  final GetGenreMoviesUseCase genreMoviesUseCase;

  CategoryMoviesBloc(this.genreMoviesUseCase):super(const CategoryMoviesState()){
    on<GetAllCategoryMoviesEvent>(_getAllCategoryMovies);
  }

  int categoryCurrentPage = 1;
  var categoryMovies =<Movies>[];

  FutureOr<void> _getAllCategoryMovies(GetAllCategoryMoviesEvent event, Emitter<CategoryMoviesState> emit) async{
    emit(state.copyWith(categoryMoviesState: RequestState.loading));
    final result = await genreMoviesUseCase(GenresMoviesParameters(currentIndex: categoryCurrentPage,genreId: event.id));
    result.fold((l) => (emit(state.copyWith(
        categoryMoviesState: RequestState.error,
        categoryMoviesMessage: l.message))),
            (r) {
          r.removeWhere((element) => element.image == null);
          categoryCurrentPage++;
          categoryMovies.addAll(r);
          emit(state.copyWith(
              categoryMoviesState: RequestState.loaded,
              categoryMovies: categoryMovies
          ));

        }
    );


  }
}