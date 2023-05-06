import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedPage;
  const CustomBottomNavigationBar({super.key, required this.selectedPage});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => context.go('/home/$index'),
      currentIndex: selectedPage,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.label_outline), label: 'Categories'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: 'Favourites'),
      ],
    );
  }
}
