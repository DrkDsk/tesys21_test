import 'package:tesys21_test/src/features/show_pokemon/data/models/ability_model.dart';
import 'package:tesys21_test/src/features/show_pokemon/data/models/move_model.dart';
import 'package:tesys21_test/src/features/show_pokemon/data/models/stat_model.dart';
import 'package:tesys21_test/src/features/show_pokemon/data/models/type_model.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/entities/show_pokemon_response.dart';

class ShowPokemonResponseModel {
  ShowPokemonResponseModel({
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

  final List<AbilityModel> abilities;
  final int? baseExperience;
  final int? height;
  final int? id;
  final List<MoveModel> moves;
  final String? name;
  final List<StatModel> stats;
  final List<TypeModel> types;
  final int? weight;

  ShowPokemonResponseModel copyWith({
    List<AbilityModel>? abilities,
    int? baseExperience,
    int? height,
    int? id,
    List<MoveModel>? moves,
    String? name,
    List<StatModel>? stats,
    List<TypeModel>? types,
    int? weight,
  }) {
    return ShowPokemonResponseModel(
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

  ShowPokemonResponse toEntity() {
    return ShowPokemonResponse(
        abilities: abilities.map((x) => x.toEntity()).toList(),
        baseExperience: baseExperience,
        height: height,
        id: id,
        moves: moves.map((x) => x.toEntity()).toList(),
        name: name,
        stats: stats.map((x) => x.toEntity()).toList(),
        types: types.map((x) => x.toEntity()).toList(),
        weight: weight);
  }

  Map<String, dynamic> toMap() {
    return {
      'abilities': abilities,
      'baseExperience': baseExperience,
      'height': height,
      'id': id,
      'moves': moves,
      'name': name,
      'stats': stats,
      'types': types,
      'weight': weight,
    };
  }

  factory ShowPokemonResponseModel.fromJson(Map<String, dynamic> map) {
    return ShowPokemonResponseModel(
      abilities: map["abilities"] == null ? [] : List<AbilityModel>.from(map["abilities"]!.map((x) => AbilityModel.fromJson(x))),
      baseExperience: (map['baseExperience'] as num?)?.toInt(),
      height: (map['height'] as num?)?.toInt(),
      id: (map['id'] as num?)?.toInt(),
      moves: map['moves'] == null ? [] : List<MoveModel>.from(map["moves"]!.map((x) => MoveModel.fromJson(x))),
      name: map['name'] as String,
      stats: map['stats'] == null ? [] : List<StatModel>.from(map["stats"]!.map((x) => StatModel.fromJson(x))),
      types: map['types'] == null ? [] : List<TypeModel>.from(map["types"]!.map((x) => TypeModel.fromJson(x))),
      weight: (map['weight'] as num?)?.toInt(),
    );
  }
}
