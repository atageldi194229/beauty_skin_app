import 'package:beauty_skin/constants/constants.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: COLOR_CONST.primaryColor,
      body: Center(
        child: Text("Favorites Screen"),
      ),
    );
  }
}
