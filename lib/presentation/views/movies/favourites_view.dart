import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepidea/presentation/providers/providers.dart';
import 'package:moviepidea/presentation/widgets/widgets.dart';

// initstate
// solo las primera 10
class FavouritesView extends ConsumerStatefulWidget {
  const FavouritesView({super.key});

  @override
  FavouritesViewState createState() => FavouritesViewState();
}

class FavouritesViewState extends ConsumerState<FavouritesView> {
  bool isLastPage = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    ref.read(favouritesMoviesProvider.notifier).loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;

    isLoading = true;
    final movies =
        await ref.read(favouritesMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(favouritesMoviesProvider).values.toList();

    return Scaffold(
        body: MovieMasonry(
      loadNextPage: loadNextPage,
      movies: movies,
    ));
  }
}
