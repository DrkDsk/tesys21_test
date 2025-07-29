import 'package:dartz/dartz.dart';
import 'package:tesys21_test/src/core/error/exceptions/unknown_exception.dart';
import 'package:tesys21_test/src/core/failure/failure.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/datasources/pokemon_list_datasource.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/entities/pokemon_list_response.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';

class PokemonListRepositoryImpl implements PokemonListRepository {

  final PokemonListDataSource dataSource;

  PokemonListRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, PokemonListResponse>> getPokemonList({required int offset, required int limit}) async {
    try {
      final model = await dataSource.getPokemonList(offset: offset, limit: limit);
      return Right(model.toEntity());
    } on UnknownException catch (e) {
      return Left(GenericFailure(e.message));
    }
    catch (_) {
      return Left(GenericFailure("Ha ocurrido un error"));
    }
  }

}