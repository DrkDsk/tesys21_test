import 'package:tesys21_test/src/features/show_pokemon/domain/entities/ability.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/entities/move.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/entities/stat.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/entities/type.dart';

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
