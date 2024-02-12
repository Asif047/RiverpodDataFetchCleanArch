import 'package:dio/dio.dart';
import 'package:movie_mania_practice/data/data_sources/movie_data_source.dart';
import 'package:network/network.dart';

class MovieDataSourceImpl implements MovieDataSource {
  MovieDataSourceImpl({
    required this.client,
  });

  final RestClient client;

  Map<String, dynamic> customHeaders = {
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YzkzMWNjNDRiM2I4Nzk5MWY5ODNhYmIxOWU4MGVkMCIsInN1YiI6IjY1YzlhZWViMDgzNTQ3MDE4NGNmNTQwYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.f1-svkXb3wggVMWe3x5Qj9ptfXZ7BYzjKEl-V4LHBRg'
  };

  @override
  Future<Response> fetchMovieList() async {
    return await client.get(
      APIType.public,
      'upcoming?language=en-US&page=1',
      headers: customHeaders
    );
  }

}
