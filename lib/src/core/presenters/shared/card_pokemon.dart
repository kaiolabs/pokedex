import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/src/core/presenters/shared/tag.dart';
import 'package:pokedex/src/core/presenters/theme/color_outlet.dart';

import '../theme/font_family_outlet.dart';
import '../theme/size_outlet.dart';
import 'favorited_button.dart';

class CardPokemon extends StatefulWidget {
  final int id;
  final String name;
  final String image;
  final List types;
  final String color;
  final ValueNotifier<bool> isFavorite;
  final Function(bool) onFavorite;
  final Function() onTap;
  const CardPokemon({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.types,
    required this.isFavorite,
    required this.onFavorite,
    required this.onTap,
    required this.color,
  });

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  colorCard(String color) {
    switch (color) {
      case 'black':
        return ColorOutlet.colorCardBlack;
      case 'blue':
        return ColorOutlet.colorCardBlue;
      case 'brown':
        return ColorOutlet.colorCardBrown;
      case 'gray':
        return ColorOutlet.colorCardGray;
      case 'green':
        return ColorOutlet.colorCardGreen;
      case 'pink':
        return ColorOutlet.colorCardPink;
      case 'purple':
        return ColorOutlet.colorCardPurple;
      case 'red':
        return ColorOutlet.colorCardRed;
      case 'white':
        return ColorOutlet.colorCardWhite;
      case 'yellow':
        return ColorOutlet.colorCardYellow;
      default:
        return ColorOutlet.colorCardBlack;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeOutlet.paddingSizeDefault),
      child: Container(
        // gradient: LinearGradient(
        decoration: BoxDecoration(
          color: colorCard(widget.color),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorCard(widget.color),
              colorCard(widget.color),
              colorCard(widget.color).withOpacity(0.8),
              colorCard(widget.color).withOpacity(0.7),
              colorCard(widget.color).withOpacity(0.6),
              colorCard(widget.color),
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(SizeOutlet.borderRadiusSizeNormal)),
        ),
        margin: const EdgeInsets.only(top: SizeOutlet.paddingSizeDefault, bottom: SizeOutlet.paddingSizeDefault),
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(
            SizeOutlet.borderRadiusSizeNormal,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: MediaQuery.of(context).size.width * 0.8,
                bottom: MediaQuery.of(context).size.height * 0.13,
                child: FavoritedButton(
                  isFavorited: widget.isFavorite,
                  size: SizeOutlet.iconSizeDefault,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeOutlet.paddingSizeLarge, vertical: SizeOutlet.paddingSizeMedium),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '#${widget.id.toString().padLeft(3, '0')}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: SizeOutlet.textSizeMicro2,
                            fontFamily: FontFamilyOutlet.defaultFontFamilyRegular,
                          ),
                        ),
                        Text(
                          widget.name[0].toUpperCase() + widget.name.substring(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: SizeOutlet.textSizeSmall2,
                            fontFamily: FontFamilyOutlet.defaultFontFamilyMedium,
                          ),
                        ),
                        Row(
                          children: [
                            for (var type in widget.types) Tag(text: type['type']['name']),
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      top: 0,
                      left: MediaQuery.of(context).size.width * 0.32,
                      child: Container(
                        constraints: const BoxConstraints(
                          maxHeight: SizeOutlet.imageSizeExtraLarge,
                          maxWidth: SizeOutlet.imageSizeExtraLarge,
                        ),
                        child: SvgPicture.network(
                          widget.image,
                          placeholderBuilder: (context) => Center(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
