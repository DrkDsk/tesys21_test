import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesys21_test/src/core/constants/string_constants.dart';
import 'package:tesys21_test/src/core/di/bloc_injector.dart';
import 'package:tesys21_test/src/core/extensions/string_extension.dart';
import 'package:tesys21_test/src/core/router/app_router.dart';
import 'package:tesys21_test/src/core/shared/ui/widgets/image_network_widget.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/entities/result.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/blocs/pokemon_show_bloc.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/screens/pokemon_details_screen.dart';

class PokemonCardWidget extends StatelessWidget {
  final Result pokemon;

  const PokemonCardWidget({
    super.key,
    required this.pokemon,
  });

  Future<void> _handleShowPokemonNavigation(
      {required BuildContext context, required int pokemonId}) async {
    AppRouter.of(context).goToScreen(BlocProvider(
        create: (context) => getIt<PokemonShowBloc>(),
        child: PokemonDetailsScreen(pokemonId: pokemonId)));
  }

  @override
  Widget build(BuildContext context) {
    final String pokemonId = pokemon.id;
    final String imageUrl = "$kPokemonImageBasePath/$pokemonId.png";
    final String? name = pokemon.name;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: (name != null)
          ? GestureDetector(
              onTap: () => _handleShowPokemonNavigation(
                  context: context, pokemonId: int.tryParse(pokemonId) ?? 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  ImageNetworkWidget(imageUrl: imageUrl, height: 100, width: 100),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
