import 'package:flutter/cupertino.dart';
import 'package:pokedex/src/core/repositories/objectbox_db.dart';
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
  PageController pageController = PageController(initialPage: 0);
  ValueNotifier<int> basePageIndex = ValueNotifier<int>(0);
  final ObjectBoxDB objectBoxDB;

  BaseController({
    required this.homeController,
    required this.pokedexController,
    required this.favoritesController,
    required this.pageController,
    required this.basePageIndex,
    required this.objectBoxDB,
  }) : pages = [
          HomeView(
            controller: homeController,
            pageController: pageController,
            basePageIndex: basePageIndex,
            pokedexController: pokedexController,
            objectBoxDB: objectBoxDB,
            favoritesController: favoritesController,
          ),
          PokedexView(
            controller: pokedexController,
            pageController: pageController,
            objectBoxDB: objectBoxDB,
            basePageIndex: basePageIndex,
          ),
          FavoritesView(
            controller: favoritesController,
            objectBoxDB: objectBoxDB,
            basePageIndex: basePageIndex,
            pageController: pageController,
            pokedexController: pokedexController,
          ),
        ];
}
