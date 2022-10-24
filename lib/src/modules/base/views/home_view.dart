// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/src/core/presenters/shared/card_pokemon.dart';
import 'package:pokedex/src/core/presenters/theme/size_outlet.dart';
import 'package:pokedex/src/modules/base/controllers/home_controller.dart';
import 'package:pokedex/src/modules/base/views/header_home.dart';

class HomeView extends StatefulWidget {
  final HomeController controller;
  const HomeView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderHome(
          controllerSearch: widget.controller.controllerSearch,
          onChanged: (value) {
            widget.controller.searchPokemon();
          },
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: widget.controller.isLoadList,
            builder: (context, value, child) => widget.controller.isLoadList.value
                ? ValueListenableBuilder(
                    valueListenable: widget.controller.quantidadeDePokemons,
                    builder: (context, value, child) => ValueListenableBuilder(
                      valueListenable: widget.controller.listaPokemon,
                      builder: (context, value, child) => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.controller.quantidadeDePokemons.value,
                        itemBuilder: (context, index) {
                          return CardPokemon(
                            id: widget.controller.listaPokemon.value[index].id,
                            name: widget.controller.listaPokemon.value[index].name,
                            image: widget.controller.listaPokemon.value[index].sprite,
                            types: widget.controller.listaPokemon.value[index].types,
                            color: widget.controller.listaPokemon.value[index].color,
                            isFavorite: ValueNotifier<bool>(false),
                            onFavorite: (value) {},
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: Center(
                      child: Lottie.asset(
                        'assets/lottie/pokeball_loading.json',
                        width: SizeOutlet.imageSizeLarge,
                        height: SizeOutlet.imageSizeLarge,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
