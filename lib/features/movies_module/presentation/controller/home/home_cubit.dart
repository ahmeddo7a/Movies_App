import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies_module/presentation/screens/layout/movie_categories_screen.dart';
import 'package:movies_app/features/movies_module/presentation/screens/layout/movie_search_screen.dart';

import '../../screens/movies_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const MoviesScreen(),
    const MoviesCategoriesScreen(),
    const MoviesSearchScreen(),
  ];

  void changeBottom(int index){
    emit(HomeInitial());
    currentIndex = index;
    print(index);
    emit(HomeChangeBottomNavState());
  }
}
