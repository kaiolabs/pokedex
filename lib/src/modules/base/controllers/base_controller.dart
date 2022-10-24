import 'package:flutter/cupertino.dart';
import 'package:pokedex/src/modules/base/controllers/favorites_controller.dart';
import 'package:pokedex/src/modules/base/controllers/home_controller.dart';
import 'package:pokedex/src/modules/base/controllers/pokedex_controller.dart';
import 'package:pokedex/src/modules/base/views/favorites_view.dart';
import 'package:pokedex/src/modules/base/views/home_view.dart';
import 'package:pokedex/src/modules/base/views/pokedex_view.dart';

class BaseController extends ChangeNotifier {
  final List<Widget> pages;
  final HomeController homeController;
  final PokedexController pokedexController;
  final FavoritesController favoritesController;

  BaseController({
    required this.homeController,
    required this.pokedexController,
    required this.favoritesController,
  }) : pages = [
          HomeView(controller: homeController),
          PokedexView(controller: pokedexController),
          FavoritesView(controller: favoritesController),
        ];

  PageController pageController = PageController(initialPage: 0);
  ValueNotifier<int> basePageIndex = ValueNotifier<int>(0);
}
