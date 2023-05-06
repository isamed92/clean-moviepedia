import 'package:flutter/material.dart';
import 'package:moviepidea/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final Widget childView;
  const HomeScreen({Key? key, required this.childView}) : super(key: key);

  static const name = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: childView,
        bottomNavigationBar: const CustomBottomNavigationBar());
  }
}
