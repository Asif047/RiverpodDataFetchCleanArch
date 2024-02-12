import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mania_practice/core/state/base_state.dart';
import 'package:movie_mania_practice/data/models/model_movie_list.dart';
import 'package:movie_mania_practice/domain/use_cases/movies_use_case.dart';

class ProductsNotifier extends StateNotifier<BaseState> {
  ProductsNotifier({
    required this.useCase,
  }) : super(InitialState());

  final MoviesUseCase useCase;

  ModelMovieList _products = ModelMovieList(
    dates: Dates(maximum: DateTime.now(), minimum: DateTime.now()),
    page: 0,
    results: [],
    totalPages: 0,
    totalResults: 0,
  );

  Future<void> productList() async {
    print("###AAA:");
    state = const LoadingState();
    try {
      final result = await useCase.movieList();
      result.fold(
        (l) {
          log(
            'ProductsNotifier.productList',
            error: l,
          );
          return state = ErrorState(data: l.toString());
        },
        (r) {
          _products = r;
          return state = SuccessState(data: r);
        },
      );
    } catch (e, stacktrace) {
      log(
        'ProductsNotifier.productList',
        error: e,
        stackTrace: stacktrace,
      );
      state = ErrorState(data: e.toString());
    }
  }
}
