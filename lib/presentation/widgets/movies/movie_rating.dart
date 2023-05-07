import 'package:flutter/material.dart';
import 'package:moviepidea/config/helpers/human_formats.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({
    super.key,
    required this.voteAverage,
    required this.popularity,
  });

  final double voteAverage;
  final double popularity;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(
            Icons.star_half_outlined,
            color: Colors.yellow.shade800,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            '$voteAverage',
            style:
                textStyle.bodyMedium!.copyWith(color: Colors.yellow.shade800),
          ),
          const Spacer(),
          const Icon(
            Icons.remove_red_eye_outlined,
            size: 16,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(HumanFormats.number(popularity), style: textStyle.bodySmall)
        ],
      ),
    );
  }
}
