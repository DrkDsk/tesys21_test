
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/species.dart';

class Ability {
  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final Species? ability;
  final bool? isHidden;
  final int? slot;

  Ability copyWith({
    Species? ability,
    bool? isHidden,
    int? slot,
  }) {
    return Ability(
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
    );
  }
}