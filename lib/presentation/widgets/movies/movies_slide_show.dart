import 'package:flutter/material.dart';
import 'package:moviepidea/domain/entities/movie.dart';
import 'package:card_swiper/card_swiper.dart';

class MoviesSlideShow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
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
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
