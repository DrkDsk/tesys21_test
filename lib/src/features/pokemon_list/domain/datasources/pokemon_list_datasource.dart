import 'package:tesys21_test/src/features/pokemon_list/data/models/pokemon_list_response_model.dart';

abstract class PokemonListDataSource {
  Future<PokemonListResponseModel> getPokemonList({required int offset, required int limit});
}