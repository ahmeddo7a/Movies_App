import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import '../../../../../core/services/service_locator.dart';

class MoviesScreen extends StatefulWidget {
  final VoidCallback showNavigation;
  final VoidCallback hideNavigation;

  const MoviesScreen(
      {Key? key, required this.showNavigation, required this.hideNavigation})
      : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        widget.showNavigation();
      } else {
        widget.hideNavigation();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        widget.showNavigation();
      } else {
        widget.hideNavigation();
      }
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()
        ..add(GetTrendingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          controller: scrollController,
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TrendingMoviesWidget(hideNavigation: widget.hideNavigation,showNavigation: widget.showNavigation,),
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
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, PopularScreen(hideNavigation: widget.hideNavigation,showNavigation: widget.showNavigation,));

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
                            Icon(Icons.arrow_forward_ios,
                                size: 16.0, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               PopularMoviesWidget(hideNavigation: widget.hideNavigation,showNavigation: widget.showNavigation,),
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
                        navigateTo(context, TopRatedScreen(showNavigation: widget.showNavigation,hideNavigation: widget.hideNavigation,));

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
              TopRatedMoviesWidget(hideNavigation: widget.hideNavigation,showNavigation: widget.showNavigation),
              const SizedBox(height: 80.0),
            ],
          ),
        ),
      ),
    );
  }
}
