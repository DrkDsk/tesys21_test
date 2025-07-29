import 'package:tesys21_test/src/features/pokemon_details/data/models/details_pokemon_response_model.dart';
import 'package:tesys21_test/src/features/pokemon_details/data/models/show_pokemon_response_model.dart';

abstract class PokemonShowDataSource {
  Future<ShowPokemonResponseModel> getPokemonInformation({required int id});
  Future<DetailsPokemonResponseModel> getPokemonDescription({required int id});
}