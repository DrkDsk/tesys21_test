import 'package:flutter/material.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/entities/result.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/widgets/pokemon_card_widget.dart';

class PokemonGridWidget extends StatelessWidget {
  const PokemonGridWidget({
    super.key,
    required this.pokemonList,
  });

  final List<Result> pokemonList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        final currentPokemon = pokemonList[index];
        return PokemonCardWidget(pokemon: currentPokemon);
      },
    );
  }
}