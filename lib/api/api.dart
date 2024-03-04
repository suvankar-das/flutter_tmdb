import 'dart:convert';
import 'package:ott_code_frontend/enviorment_var.dart';
import 'package:ott_code_frontend/models/Casts.dart';
import 'package:ott_code_frontend/models/Movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _tendingUri =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${EnvironmentVars.api_key}';

  static const _upcomingMoviesUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${EnvironmentVars.api_key}';

  static const _topratedMovies =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${EnvironmentVars.api_key}';

  static String movieCredits(int movieId) {
    var baseUrl = EnvironmentVars.baseUrl;
    return '$baseUrl/movie/$movieId/credits?api_key=${EnvironmentVars.api_key}&language=en-US';
  }

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_tendingUri));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List; // entire json from api
      //print(decodedData);
      return decodedData
          .map((movieResponse) => Movie.fromJson(movieResponse))
          .toList();
    } else {
      throw Exception("Something bad happens");
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingMoviesUrl));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List; // entire json from api

      return decodedData
          .map((movieResponse) => Movie.fromJson(movieResponse))
          .toList();
    } else {
      throw Exception("Something bad happens");
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topratedMovies));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['results'] as List; // entire json from api

      return decodedData
          .map((movieResponse) => Movie.fromJson(movieResponse))
          .toList();
    } else {
      throw Exception("Something bad happens");
    }
  }

  Future<List<Casts>> getMovieCasts(int movieId) async {
    final response = await http.get(Uri.parse(movieCredits(movieId)));
    if (response.statusCode == 200) {
      final decodedData =
          json.decode(response.body)['cast'] as List; // entire json from api

      // if (kDebugMode) {
      //   print(decodedData);
      // }
      return decodedData
          .map((castResponse) => Casts.fromJson(castResponse))
          .toList();
    } else {
      throw Exception("Something bad happens");
    }
  }
}
