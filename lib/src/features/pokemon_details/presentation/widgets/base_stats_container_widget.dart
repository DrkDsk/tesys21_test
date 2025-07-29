import 'package:flutter/material.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/show_pokemon_response.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/widgets/base_stats_item_widget.dart';

class BaseStatsContainerWidget extends StatelessWidget {
  const BaseStatsContainerWidget({
    super.key,
    required this.response,
    required this.tile
  });

  final String tile;
  final ShowPokemonResponse response;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            tile,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500]),
          ),
        ),
        const SizedBox(height: 12),
        ...response.stats.map(
              (stat) {
            final statName = stat.stat?.name;
            final baseStat = stat.baseStat ?? 0;
            final baseStateValue = baseStat / 255;

            return Column(
              children: [
                if (statName != null &&
                    statName.isNotEmpty) ...[
                  BaseStatsItemWidget(
                      statName: statName,
                      baseStat: baseStat,
                      baseStateValue: baseStateValue)
                ],
                const SizedBox(height: 8),
              ],
            );
          },
        )
      ],
    );
  }
}