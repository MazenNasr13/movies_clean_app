import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_clean_app/core/error/exception.dart';
import 'package:movies_clean_app/features/movies/data/models/movie_model.dart';

import '../../../../core/constants.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getAllMovies({bool isShowingNow = true});
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client; // ???

  MovieRemoteDataSourceImpl({required this.client});

  final _showingNowUrl = 'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants().apiKey}';

  final _comingSoonUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants().apiKey}';

  @override
  Future<List<MovieModel>> getAllMovies({bool isShowingNow = true}) async {
    final response = await client.get(Uri.parse(isShowingNow ? _showingNowUrl : _comingSoonUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      final List<MovieModel> movieModels = decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
      return movieModels;
    } else {
      throw ServerException();
    }
  }
}
