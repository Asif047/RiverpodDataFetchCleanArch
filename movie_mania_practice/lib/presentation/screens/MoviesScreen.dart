import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mania_practice/core/state/base_state.dart';
import 'package:movie_mania_practice/data/models/model_movie_list.dart';
import 'package:movie_mania_practice/presentation/riverpod/providers.dart';

class MovieListPage extends ConsumerStatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends ConsumerState<MovieListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(moviesProvider.notifier).productList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(moviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              //context.pushNamed(Routes.login.name);
            },
            icon: const Icon(
              Icons.login,
            ),
          )
        ],
      ),
      body:  state is LoadingState
          ?  Container()
          : state is SuccessState<ModelMovieList>
          ? RefreshIndicator(
            onRefresh: () async {

              await ref
                  .read(moviesProvider.notifier)
                  .productList();
            },
            child: Text('${state.data?.results[0].title}'),
          )
          : const Center(child: Text('Error')),
    );
  }
}
