class AppConstants{
  static const String apiKey='4f2f18a881c0635328c5b49ee4ac58ee';
  static const String baseUrl='https://api.themoviedb.org/3';
  static const String trendingMoviesPath = '$baseUrl/trending/movie/day?api_key=$apiKey';
  static const String popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static String movieDetailsPath(int movieId) => '$baseUrl/movie/$movieId?api_key=$apiKey';
  static String movieRecommendationPath(int movieId) => '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';
  static String allPopularMoviesPath(int currentPage) => '$baseUrl/movie/popular?api_key=$apiKey&page=$currentPage';
  static String allTopRatedMoviesPath(int currentPage) => '$baseUrl/movie/top_rated?api_key=$apiKey&page=$currentPage';
  static String searchMoviesPath(int currentPage,String name) => '$baseUrl/search/movie?api_key=$apiKey&language=en-US&query=$name&page=$currentPage&include_adult=false';



  //static const String genresPath = '$baseUrl/genre/movie/list?api_key=$apiKey';
  static String selectedGenres(int genreId, int currentPage) => '$baseUrl/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$currentPage&with_genres=$genreId&with_watch_monetization_types=flatrate';




  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) =>'$baseImageUrl$path';

}