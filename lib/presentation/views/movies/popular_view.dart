import 'package:flutter/material.dart';
import 'package:moviepidea/presentation/widgets/widgets.dart';

class PopularView extends StatelessWidget {
  const PopularView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieMasonry(movies: []),
    );
  }
}
