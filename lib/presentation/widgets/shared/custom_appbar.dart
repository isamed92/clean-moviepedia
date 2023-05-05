import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moviepidea/domain/entities/movie.dart';
import 'package:moviepidea/presentation/delegates/search_movie_delegate.dart';
import 'package:moviepidea/presentation/providers/providers.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_outlined,
                color: colors.primary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Moviepedia',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    final searchedMovies = ref.read(searchedMoviesProvider);
                    final searchQuery = ref.read(searchQueryProvider);
                    showSearch<Movie?>(
                        query: searchQuery,
                        context: context,
                        delegate: SearchMovieDelegate(
                          initialMovies: searchedMovies,
                          searchMovies: ref
                              .read(searchedMoviesProvider.notifier)
                              .searchMoviesByQuery,
                        )).then((movie) {
                      if (movie != null) {
                        context.push('/movie/${movie.id}');
                      }
                    });
                  },
                  icon: const Icon(Icons.search)),
            ],
          ),
        ),
      ),
    );
  }
}
