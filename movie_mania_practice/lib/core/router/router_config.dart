
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_mania_practice/core/router/routers.dart';
import 'package:movie_mania_practice/presentation/screens/MoviesScreen.dart';

final goRouterProvider = Provider((ref) => _router);

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: Routes.movieList.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const MovieListPage(),
        );
      },
    ),
  ],
);
