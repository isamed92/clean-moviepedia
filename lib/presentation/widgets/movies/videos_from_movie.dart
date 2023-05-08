import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepidea/domain/entities/entities.dart';
import 'package:moviepidea/presentation/providers/providers.dart';

final FutureProviderFamily<List<Video>, int> futureProviderVideosFromMovie =
    FutureProvider.family((ref, int id) {
  final repository = ref.watch(movieRepositoryProvider);
  return repository.getYoutubeVideosById(id);
});

class VideosFromMovie extends ConsumerWidget {
  final int movieId;
  const VideosFromMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(futureProviderVideosFromMovie(movieId));

    return videos.when(
      data: (videos) => Container(
        margin: const EdgeInsets.only(bottom: 50),
        color: Colors.red,
        child: SizedBox(
          height: 350,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: videos.map((e) => Text(e.name)).toList(),
          ),
        ),
      ),
      error: (_, __) => const Center(
        child: Text('no hay videos :('),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
