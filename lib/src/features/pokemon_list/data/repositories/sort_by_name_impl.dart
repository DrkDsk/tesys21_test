import 'package:tesys21_test/src/features/pokemon_list/domain/entities/result.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/repositories/pokemon_sort_strategy.dart';

class SortByNameImpl implements PokemonSortStrategy {
  @override
  List<Result> sort(List<Result> pokemons) {
    return List.from(pokemons)
      ..sort((a, b) {
        final nameA = a.name ?? '';
        final nameB = b.name ?? '';
        return nameA.compareTo(nameB);
      });
  }
}