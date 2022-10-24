import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/splash_view.dart';
import 'package:pokedex/src/modules/base/base_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SplashView()),
        ModuleRoute('/base', module: BaseModule()),
      ];
}
