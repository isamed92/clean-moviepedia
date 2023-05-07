import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    final colors = Theme.of(context).colorScheme;
    if (movies.isEmpty) {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.favorite_border_sharp,
            color: colors.primary,
            size: 60,
          ),
          Text(
            'Oh no!',
            style: TextStyle(fontSize: 30, color: colors.primary),
          ),
          const Text('No tienes peliculas favoritas',
              style: TextStyle(fontSize: 20, color: Colors.black45)),
          SizedBox(
            height: 20,
          ),
          FilledButton.tonal(
              onPressed: () => context.go('/home/0'),
              child: Text('Empieza a buscar'))
        ]),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.favorite_border,
                color: Colors.pink,
              ),
              const SizedBox(
                width: 20,
              ),
              Text('Favs: ${movies.length}'),
            ],
          ),
        ),
        body: MovieMasonry(
          loadNextPage: loadNextPage,
          movies: movies,
        ));
  }
}
