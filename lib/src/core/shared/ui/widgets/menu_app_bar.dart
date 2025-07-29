import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesys21_test/src/core/enum/sort_option.dart';
import 'package:tesys21_test/src/core/shared/ui/widgets/search_pokemon_field.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_bloc.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_event.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 20, top: 35),
        color: Colors.red[700],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.red),
                        SizedBox(width: 8),
                        Expanded(
                          child: SearchPokemonField(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                PopupMenuButton<SortOption>(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
