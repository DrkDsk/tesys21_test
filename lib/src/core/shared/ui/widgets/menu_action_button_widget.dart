import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesys21_test/src/core/enum/sort_option.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_bloc.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_event.dart';

class MenuActionButtonWidget extends StatelessWidget {
  const MenuActionButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortOption>(
      onSelected: (value) {
        context.read<PokemonListBloc>().add(SortPokemonEvent(value));
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: SortOption.name,
          child: Text("Nombre"),
        ),
        PopupMenuItem(
          value: SortOption.id,
          child: Text("ID"),
        ),
      ],
      elevation: 4,
      child: const Icon(Icons.sort, color: Colors.white),
    );
  }
}