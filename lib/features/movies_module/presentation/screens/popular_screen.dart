import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/components.dart';
import 'package:movies_app/core/enum.dart';
import 'package:movies_app/features/movies_module/presentation/controller/popular_movies/see_all_movies_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/app_constants.dart';
import '../../../../core/services/service_locator.dart';
import 'movie_detail_screen.dart';

class PopularScreen extends StatelessWidget {
  final RefreshController scrollController =
      RefreshController(initialRefresh: false);

  PopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.of(context).size.width;
    final myHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) =>
          sl<SeeAllMoviesBloc>()..add(GetAllPopularMoviesEvent()),
      child: BlocBuilder<SeeAllMoviesBloc, SeeAllMoviesState>(
          buildWhen: (previous, current) =>
              current.allPopularMoviesState != RequestState.loading,
          builder: (context, state) {
            print(state.allPopularMovies.length);
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: myHeight * 0.07,
                backgroundColor: Colors.grey.shade900,
                elevation: 0,
                title: const Text(
                  'Popular Movies',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                  )
                ],
              ),
              body: Padding(
                padding: EdgeInsets.only(
                    top: myHeight * 0.01,
                    right: myWidth * 0.02,
                    left: myWidth * 0.04),
                child: SmartRefresher(
                  enablePullUp: true,
                  enablePullDown: false,
                  controller: scrollController,
                  onLoading: () async {
                    BlocProvider.of<SeeAllMoviesBloc>(context)
                        .add(GetAllPopularMoviesEvent());
                    scrollController.loadComplete();
                  },
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final movie = state.allPopularMovies[index];
                      return SizedBox(
                        height: myHeight * 0.23,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              child: CachedNetworkImage(
                                width: myWidth * 0.35,
                                height: myHeight * 0.23,
                                fit: BoxFit.cover,
                                imageUrl: AppConstants.imageUrl(movie.image!),
                              ),
                            ),
                            SizedBox(
                              width: myWidth * 0.05,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    movie.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        (movie.voteAverage / 2)
                                            .toStringAsFixed(1),
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        ' (${movie.voteAverage}/10)',
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Released : ",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      Text(
                                        movie.releaseDate,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: myHeight * 0.01,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      width: myWidth * 0.4,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          navigateAndFinish(context,
                                              MovieDetailScreen(id: movie.id));
                                        },
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  vertical: 3)),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                  color: Colors.teal),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.teal),
                                        ),
                                        child: const Text(
                                          "More ..",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: state.allPopularMovies.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
