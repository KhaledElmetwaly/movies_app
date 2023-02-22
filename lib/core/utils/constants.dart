class AppConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '665e6fb5329df426658bf7bacddbc4e3';
  static const String nowPlayingMovies =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMovies = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMovies =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String movieDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';
  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
  static String imageUrl(String path) => '$baseImageUrl$path';
}
