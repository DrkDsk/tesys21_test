import 'package:tesys21_test/src/features/pokemon_details/data/models/color_entity_model.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/flavor_text_entry.dart';

class FlavorTextEntryModel {
  FlavorTextEntryModel({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  final String? flavorText;
  final ColorEntityModel? language;
  final ColorEntityModel? version;

  FlavorTextEntryModel copyWith({
    String? flavorText,
    ColorEntityModel? language,
    ColorEntityModel? version,
  }) {
    return FlavorTextEntryModel(
      flavorText: flavorText ?? this.flavorText,
      language: language ?? this.language,
      version: version ?? this.version,
    );
  }

  FlavorTextEntry toEntity() {
    return FlavorTextEntry(
        flavorText: flavorText,
        language: language?.toEntity(),
        version: version?.toEntity()
    );
  }

  factory FlavorTextEntryModel.fromJson(Map<String, dynamic> json) {
    return FlavorTextEntryModel(
      flavorText: json["flavor_text"],
      language: json["language"] == null
          ? null
          : ColorEntityModel.fromJson(json["language"]),
      version: json["version"] == null
          ? null
          : ColorEntityModel.fromJson(json["version"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language?.toJson(),
        "version": version?.toJson(),
      };
}
