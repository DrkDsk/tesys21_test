import 'package:tesys21_test/src/features/pokemon_list/domain/entities/result.dart';

abstract class PokemonSortStrategy {
  List<Result> sort(List<Result> pokemons);
}