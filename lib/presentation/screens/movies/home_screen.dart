import 'package:flutter/material.dart';
import 'package:moviepidea/config/constants/environment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const name = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Environment.movieDBKey),
      ),
    );
  }
}
