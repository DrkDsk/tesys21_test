import 'package:dartz/dartz.dart';
import 'package:tesys21_test/src/core/failure/failure.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/entities/pokemon_list_response.dart';

abstract class PokemonListRepository {
  Future<Either<Failure, PokemonListResponse>> getPokemonList({required int offset, required int limit});
}