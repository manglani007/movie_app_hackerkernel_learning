import 'package:dio/dio.dart';
import 'package:movie_app/const/tmdb-const.dart';
import 'package:movie_app/models/movie_detail.dart';
import 'package:movie_app/models/movie_model.dart';

import '../models/gener_model.dart';

class MovieRepo {
  final Dio _dio = Dio();

  Future<List<Genres>> getAllgenres() async {
    try {
      var parames = {"api_key": TmdbConsts.kApiKey};
      var url = "${TmdbConsts.kBaseUrl}${TmdbConsts.kGetgenresEndPoint}";
      Response response = await _dio.get(url, queryParameters: parames);
      List res = response.data["genres"];
      List<Genres> genres = [];
      for (var element in res) {
        genres.add(Genres.fromJson(element));
      }
      return genres;
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieList> getMovieList(Genres gener) async {
    try {
      var parames = {"api_key": TmdbConsts.kApiKey, "with_genres": gener.id};
      var url = "${TmdbConsts.kBaseUrl}${TmdbConsts.kGetListEndPoint}";

      Response response = await _dio.get(url, queryParameters: parames);
      return MovieList.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieDetail> getMovieDetails(Movie movie) async {
    try {
      var parames = {"api_key": TmdbConsts.kApiKey};
      var url =
          "${TmdbConsts.kBaseUrl}${TmdbConsts.kGetMovieDetails.replaceAll("####", movie.id!.toString())}";
      //  log(url);
      Response response = await _dio.get(url, queryParameters: parames);

      return MovieDetail.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
