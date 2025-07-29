import 'package:flutter/material.dart';
import 'package:tesys21_test/src/core/shared/ui/widgets/menu_action_button_widget.dart';
import 'package:tesys21_test/src/core/shared/ui/widgets/search_pokemon_field.dart';

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
               const MenuActionButtonWidget(),
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
