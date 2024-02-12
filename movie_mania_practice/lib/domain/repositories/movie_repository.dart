import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mania_practice/core/network/error_model.dart';
import 'package:movie_mania_practice/data/data_sources/movie_data_source.dart';
import 'package:movie_mania_practice/data/models/model_movie_list.dart';
import 'package:movie_mania_practice/data/repositories/movie_repository_imp.dart';

final movieRepositoryProvider = Provider(
      (ref) {
    return MovieRepositoryImpl(
      dataSource: ref.read(movieDataSourceProvider),
    );
  },
);

abstract class MovieRepository {
  Future<Either<ErrorModel, ModelMovieList>> movieList();

}