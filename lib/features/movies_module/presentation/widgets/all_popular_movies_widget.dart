/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app_constants.dart';
import 'package:movies_app/features/movies_module/domain/entities/movie.dart';
import 'package:movies_app/features/movies_module/presentation/controller/popular_movies/popular_movie_cubit.dart';

class BuildPopularMovieItem extends StatelessWidget {
  final Movies movies;

  const BuildPopularMovieItem({required this.movies, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery
        .of(context)
        .size
        .width;
    final myHeight = MediaQuery
        .of(context)
        .size
        .height;

    return SizedBox(
      height: myHeight * 0.2,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: CachedNetworkImage(
              width: myWidth * 0.35,
              height: myHeight * 0.2,
              fit: BoxFit.fitHeight,
              imageUrl: AppConstants.imageUrl(movies.image!),
            ),
          ),
          SizedBox(
            width: myWidth * 0.05,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: myHeight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movies.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
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
                        (movies.voteAverage / 2).toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                            color: Colors.white),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '(${movies.voteAverage})',
                        style: const TextStyle(
                          fontSize: 1.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Released : ",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        movies.releaseDate,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
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
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 3)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.teal),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.teal),
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
          ),
        ],
      ),
    );
  }
}


 */
