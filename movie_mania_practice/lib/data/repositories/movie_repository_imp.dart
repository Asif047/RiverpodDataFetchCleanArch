import 'package:dartz/dartz.dart';
import 'package:movie_mania_practice/core/network/request_handler.dart';
import 'package:movie_mania_practice/data/data_sources/movie_data_source.dart';
import 'package:movie_mania_practice/data/models/model_movie_list.dart';
import 'package:movie_mania_practice/domain/repositories/movie_repository.dart';

import '../../core/network/error_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({required this.dataSource});

  final MovieDataSource dataSource;

  @override
  Future<Either<ErrorModel, ModelMovieList>> movieList() async {
    return await dataSource.fetchMovieList().guard(
          (data) => ModelMovieList.fromJson(data),
    );
  }


}