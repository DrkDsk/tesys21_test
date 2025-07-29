import 'package:tesys21_test/src/features/pokemon_details/data/models/color_entity_model.dart';
import 'package:tesys21_test/src/features/pokemon_details/data/models/flavor_text_entry_model.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/details_pokemon_response.dart';

class DetailsPokemonResponseModel {
  DetailsPokemonResponseModel({
    required this.color,
    required this.flavorTextEntries,
  });

  final ColorEntityModel? color;
  final List<FlavorTextEntryModel> flavorTextEntries;

  DetailsPokemonResponseModel copyWith({
    ColorEntityModel? color,
    List<FlavorTextEntryModel>? flavorTextEntries,
  }) {
    return DetailsPokemonResponseModel(
      color: color ?? this.color,
      flavorTextEntries: flavorTextEntries ?? this.flavorTextEntries,
    );
  }

  factory DetailsPokemonResponseModel.fromJson(Map<String, dynamic> json){
    return DetailsPokemonResponseModel(
      color: json["color"] == null ? null : ColorEntityModel.fromJson(json["color"]),
      flavorTextEntries: json["flavor_text_entries"] == null ? [] : List<FlavorTextEntryModel>.from(json["flavor_text_entries"]!.map((x) => FlavorTextEntryModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "color": color?.toJson(),
    "flavor_text_entries": flavorTextEntries.map((x) => x.toJson()).toList(),
  };

  DetailsPokemonResponse toEntity() {
    return DetailsPokemonResponse(
      color: color?.toEntity(),
      flavorTextEntries: flavorTextEntries.map((x) => x.toEntity()).toList()
    );
  }
}