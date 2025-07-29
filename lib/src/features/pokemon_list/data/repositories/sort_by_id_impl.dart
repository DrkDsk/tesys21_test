import 'package:tesys21_test/src/features/pokemon_list/domain/entities/result.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/repositories/pokemon_sort_strategy.dart';

class SortByIdImpl implements PokemonSortStrategy {
  @override
  List<Result> sort(List<Result> pokemons) {
    return List.from(pokemons)
      ..sort((a, b) {
        final idA = a.id;
        final idB = b.id;
        return idA.compareTo(idB);
      });
  }

}