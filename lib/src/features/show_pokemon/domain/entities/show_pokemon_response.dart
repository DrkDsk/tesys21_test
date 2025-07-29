import 'package:tesys21_test/src/features/show_pokemon/domain/entities/ability.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/entities/move.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/entities/species.dart';

class ShowPokemonResponse {
  ShowPokemonResponse({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.moves,
    required this.name,
    required this.stats,
    required this.types,
    required this.weight,
  });

  final List<Ability> abilities;
  final int? baseExperience;
  final int? height;
  final int? id;
  final List<Move> moves;
  final String? name;
  final List<Stat> stats;
  final List<Type> types;
  final int? weight;

  ShowPokemonResponse copyWith({
    List<Ability>? abilities,
    int? baseExperience,
    int? height,
    int? id,
    List<Move>? moves,
    String? name,
    List<Stat>? stats,
    List<Type>? types,
    int? weight,
  }) {
    return ShowPokemonResponse(
      abilities: abilities ?? this.abilities,
      baseExperience: baseExperience ?? this.baseExperience,
      height: height ?? this.height,
      id: id ?? this.id,
      moves: moves ?? this.moves,
      name: name ?? this.name,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      weight: weight ?? this.weight,
    );
  }
}

class Sprites {
  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    required this.versions,
    required this.animated,
  });

  final String? backDefault;
  final dynamic backFemale;
  final String? backShiny;
  final dynamic backShinyFemale;
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;
  final Other? other;
  final Versions? versions;
  final Sprites? animated;

  Sprites copyWith({
    String? backDefault,
    dynamic? backFemale,
    String? backShiny,
    dynamic? backShinyFemale,
    String? frontDefault,
    dynamic? frontFemale,
    String? frontShiny,
    dynamic? frontShinyFemale,
    Other? other,
    Versions? versions,
    Sprites? animated,
  }) {
    return Sprites(
      backDefault: backDefault ?? this.backDefault,
      backFemale: backFemale ?? this.backFemale,
      backShiny: backShiny ?? this.backShiny,
      backShinyFemale: backShinyFemale ?? this.backShinyFemale,
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
      other: other ?? this.other,
      versions: versions ?? this.versions,
      animated: animated ?? this.animated,
    );
  }

  factory Sprites.fromJson(Map<String, dynamic> json){
    return Sprites(
      backDefault: json["back_default"],
      backFemale: json["back_female"],
      backShiny: json["back_shiny"],
      backShinyFemale: json["back_shiny_female"],
      frontDefault: json["front_default"],
      frontFemale: json["front_female"],
      frontShiny: json["front_shiny"],
      frontShinyFemale: json["front_shiny_female"],
      other: json["other"] == null ? null : Other.fromJson(json["other"]),
      versions: json["versions"] == null ? null : Versions.fromJson(json["versions"]),
      animated: json["animated"] == null ? null : Sprites.fromJson(json["animated"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_female": backFemale,
    "back_shiny": backShiny,
    "back_shiny_female": backShinyFemale,
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
    "other": other?.toJson(),
    "versions": versions?.toJson(),
    "animated": animated?.toJson(),
  };

}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int? baseStat;
  final int? effort;
  final Species? stat;

  Stat copyWith({
    int? baseStat,
    int? effort,
    Species? stat,
  }) {
    return Stat(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  factory Stat.fromJson(Map<String, dynamic> json){
    return Stat(
      baseStat: json["base_stat"],
      effort: json["effort"],
      stat: json["stat"] == null ? null : Species.fromJson(json["stat"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat?.toJson(),
  };

}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int? slot;
  final Species? type;

  Type copyWith({
    int? slot,
    Species? type,
  }) {
    return Type(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  factory Type.fromJson(Map<String, dynamic> json){
    return Type(
      slot: json["slot"],
      type: json["type"] == null ? null : Species.fromJson(json["type"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type?.toJson(),
  };
}
