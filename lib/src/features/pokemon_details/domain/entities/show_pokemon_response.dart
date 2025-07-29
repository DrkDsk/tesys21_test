import 'package:tesys21_test/src/features/pokemon_details/domain/entities/ability.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/move.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/sprite.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/stat.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/type.dart';

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
    required this.sprites
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
  final Sprites? sprites;

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
    Sprites? sprites
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
      sprites: sprites ?? this.sprites
    );
  }
}
