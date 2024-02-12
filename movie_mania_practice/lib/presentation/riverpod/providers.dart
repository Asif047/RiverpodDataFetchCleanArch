import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mania_practice/core/state/base_state.dart';
import 'package:movie_mania_practice/data/models/model_movie_list.dart';
import 'package:movie_mania_practice/domain/use_cases/movies_use_case.dart';
import 'package:movie_mania_practice/presentation/riverpod/movies_notifier.dart';

final moviesProvider = StateNotifierProvider<ProductsNotifier, BaseState>(
      (ref) {
        print("###ZZZ");
    return ProductsNotifier(
      useCase: ref.watch(moviesUseCaseProvider),
    );
  },
);

final productDataProvider = Provider<ModelMovieList>(
      (ref) => throw UnimplementedError(),
);