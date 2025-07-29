import 'package:tesys21_test/src/features/pokemon_details/domain/entities/color_entity.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/flavor_text_entry.dart';

class DetailsPokemonResponse {
  DetailsPokemonResponse({
    required this.color,
    required this.flavorTextEntries,
  });

  final ColorEntity? color;
  final List<FlavorTextEntry> flavorTextEntries;

  DetailsPokemonResponse copyWith({
    ColorEntity? color,
    List<FlavorTextEntry>? flavorTextEntries,
  }) {
    return DetailsPokemonResponse(
      color: color ?? this.color,
      flavorTextEntries: flavorTextEntries ?? this.flavorTextEntries,
    );
  }
}
