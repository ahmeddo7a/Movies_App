import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/data/genres_movies.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/app_constants.dart';
import '../../../../../core/data/genres_movie_model.dart';

class MoviesCategoriesScreen extends StatelessWidget {
  const MoviesCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoriesContent(genresMovies: genres),
    );
  }
}

class CategoriesContent extends StatelessWidget {
  final List<GenresMovies> genresMovies;

  const CategoriesContent({Key? key, required this.genresMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 5),
      itemBuilder: (context, index) => buildGenresItems(index, context),
      itemCount: genresMovies.length,
    );
  }

  Widget buildGenresItems(int index, BuildContext context) {
    final movie = genresMovies[index];
    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      // fromLTRB
                      Colors.transparent,
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0, 0, 0.5, 0.9],
                  ).createShader(
                    Rect.fromLTRB(0, 0, rect.width, rect.height),
                  );
                },
                blendMode: BlendMode.dstIn,
                child: CachedNetworkImage(
                  // width: 150.0,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,

                  ///TODO add images for each one !!!
                  imageUrl: AppConstants.imageUrl(movie.image),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 300.0,
                      // width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  movie.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
