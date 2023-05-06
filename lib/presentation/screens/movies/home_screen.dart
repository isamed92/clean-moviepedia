import 'package:flutter/material.dart';
import 'package:moviepidea/presentation/views/views.dart';
import 'package:moviepidea/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.pageIndex});
  final int pageIndex;

  static const name = 'home';

  final _viewRoutes = <Widget>[
    const HomeView(),
    const SizedBox(),
    const FavouritesView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: pageIndex,
          children: _viewRoutes,
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedPage: pageIndex,
        ));
  }
}
