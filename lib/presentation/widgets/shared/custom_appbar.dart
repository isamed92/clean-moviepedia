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
    final movieRepository = ref.read(movieRepositoryProvider);
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
                    showSearch<Movie?>(
                        context: context,
                        delegate: SearchMovieDelegate(
                          searchMovies: movieRepository.searchMovies,
                        )).then((value) {
                      if (value != null) {
                        context.push('/movie/${value.id}');
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
