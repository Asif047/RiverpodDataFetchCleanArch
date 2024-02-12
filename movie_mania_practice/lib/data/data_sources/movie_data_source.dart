import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mania_practice/core/network/network.dart';
import 'package:movie_mania_practice/data/data_sources/movie_data_source_imp.dart';

final movieDataSourceProvider = Provider(
      (ref) {
    return MovieDataSourceImpl(
      client: ref.read(dioProvider),
    );
  },
);

abstract class MovieDataSource {
  Future<Response> fetchMovieList();
}
