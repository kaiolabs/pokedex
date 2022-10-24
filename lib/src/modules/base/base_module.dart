import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/modules/base/controllers/base_controller.dart';
import 'package:pokedex/src/modules/base/controllers/favorites_controller.dart';
import 'package:pokedex/src/modules/base/controllers/home_controller.dart';
import 'package:pokedex/src/modules/base/controllers/pokedex_controller.dart';
import 'package:pokedex/src/modules/base/views/base_view.dart';

class BaseModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController()),
        Bind.factory((i) => PokedexController()),
        Bind.factory((i) => FavoritesController()),
        Bind.factory((i) => BaseController(
              favoritesController: i.get(),
              homeController: i.get(),
              pokedexController: i.get(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => BaseView(
            controller: Modular.get<BaseController>(),
          ),
        ),
      ];
}
