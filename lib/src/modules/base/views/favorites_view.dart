import 'package:flutter/material.dart';
import 'package:pokedex/src/modules/base/controllers/favorites_controller.dart';

class FavoritesView extends StatefulWidget {
  final FavoritesController controller;
  const FavoritesView({super.key, required this.controller});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
