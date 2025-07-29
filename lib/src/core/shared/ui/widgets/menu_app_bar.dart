import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesys21_test/src/core/enum/sort_option.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_bloc.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_event.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.yellow[200],
      title: const Text("Pokédex"),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar Pokémon...',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              PopupMenuButton<SortOption>(
                icon: const Icon(Icons.sort),
                onSelected: (value) {
                  context.read<PokemonListBloc>().add(SortPokemonEvent(value));
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(value: SortOption.name, child: Text("Nombre")),
                  PopupMenuItem(value: SortOption.id, child: Text("ID")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
