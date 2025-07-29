import 'package:dartz/dartz.dart';
import 'package:tesys21_test/src/core/failure/failure.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/details_pokemon_response.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/show_pokemon_response.dart';

abstract class PokemonShowRepository {
  Future<Either<Failure, ShowPokemonResponse>> getPokemonInformation({required int id});
  Future<Either<Failure, DetailsPokemonResponse>> getPokemonDescription({required int id});
}