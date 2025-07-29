import 'package:tesys21_test/src/features/show_pokemon/data/models/species_model.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/entities/ability.dart';

class AbilityModel {
  AbilityModel({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final SpeciesModel? ability;
  final bool? isHidden;
  final int? slot;

  AbilityModel copyWith({
    SpeciesModel? ability,
    bool? isHidden,
    int? slot,
  }) {
    return AbilityModel(
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
    );
  }

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      ability:
          json["ability"] == null ? null : SpeciesModel.fromJson(json["ability"]),
      isHidden: json["is_hidden"],
      slot: json["slot"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ability": ability?.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };

  Ability toEntity() {
    return Ability(ability: ability?.toEntity(), isHidden: isHidden, slot: slot);
  }
}
