import 'package:tesys21_test/src/features/pokemon_details/domain/entities/color_entity.dart';

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  final String? flavorText;
  final ColorEntity? language;
  final ColorEntity? version;

  FlavorTextEntry copyWith({
    String? flavorText,
    ColorEntity? language,
    ColorEntity? version,
  }) {
    return FlavorTextEntry(
      flavorText: flavorText ?? this.flavorText,
      language: language ?? this.language,
      version: version ?? this.version,
    );
  }
}