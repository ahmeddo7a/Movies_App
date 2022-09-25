import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies_module/presentation/controller/home/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeState>(
          listener: (context,state){},
          builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return Scaffold(
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: const[
              BottomNavigationBarItem(icon: Icon(Icons.movie),label: 'Movies'),
              BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
            ],
          ),

        );
      }),
    );
  }
}
