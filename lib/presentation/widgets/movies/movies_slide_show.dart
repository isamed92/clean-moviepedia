import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviepidea/domain/entities/movie.dart';
import 'package:card_swiper/card_swiper.dart';

class MoviesSlideShow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        scale: 0.9,
        autoplay: true,
        viewportFraction: 0.8,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _CardSlide(movie: movie);
        },
      ),
    );
  }
}

class _CardSlide extends StatelessWidget {
  const _CardSlide({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GestureDetector(
              onTap: () => context.push('/home/0/movie/${movie.id}'),
              child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(movie.backdropPath),
                placeholder:
                    const AssetImage('assets/loaders/bottle-loader.gif'),
              ),
            )),
      ),
    );
  }
}
