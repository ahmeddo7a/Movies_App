import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/components.dart';
import 'package:movies_app/features/movies_module/presentation/controller/movies_main/movies_bloc.dart';
import 'package:movies_app/features/movies_module/presentation/controller/movies_main/movies_event.dart';
import 'package:movies_app/features/movies_module/presentation/screens/popular_screen.dart';
import 'package:movies_app/features/movies_module/presentation/screens/top_rated_screen.dart';
import 'package:movies_app/features/movies_module/presentation/widgets/popular_movies_widget.dart';
import 'package:movies_app/features/movies_module/presentation/widgets/top_rated_movies_widget.dart';
import 'package:movies_app/features/movies_module/presentation/widgets/trending_movies_widget.dart';
import '../../../../core/services/service_locator.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (BuildContext context) =>
          sl<MoviesBloc>()
            ..add(GetTrendingMoviesEvent())..add(GetPopularMoviesEvent())..add(
              GetTopRatedMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TrendingMoviesWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white

                      ),
                    ),
                    InkWell(
                      onTap: () {
                          navigateTo(context, PopularScreen());
                          ///ToDo NAVIGATE TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'See More',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularMoviesWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, TopRatedScreen());
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'See More',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 16.0, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedMoviesWidget(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
