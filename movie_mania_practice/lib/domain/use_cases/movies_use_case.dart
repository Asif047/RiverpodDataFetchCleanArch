import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mania_practice/data/models/model_movie_list.dart';
import 'package:movie_mania_practice/domain/repositories/movie_repository.dart';

import '../../core/network/error_model.dart';

final moviesUseCaseProvider = Provider(
  (ref) {
    return MoviesUseCase(
      ref.read(movieRepositoryProvider),
    );
  },
);

class MoviesUseCase {
  MoviesUseCase(this._repository);

  final MovieRepository _repository;

  Future<Either<ErrorModel, ModelMovieList>> movieList() async {
    return await _repository.movieList();
  }
}
