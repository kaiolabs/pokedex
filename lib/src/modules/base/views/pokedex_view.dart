import 'package:flutter/material.dart';
import 'package:pokedex/src/modules/base/controllers/pokedex_controller.dart';

class PokedexView extends StatefulWidget {
  final PokedexController controller;
  const PokedexView({super.key, required this.controller});

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
