import 'package:dartz/dartz.dart';
import 'package:tesys21_test/src/core/error/exceptions/unknown_exception.dart';
import 'package:tesys21_test/src/core/failure/failure.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/datasources/pokemon_show_datasource.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/details_pokemon_response.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/show_pokemon_response.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/repositories/pokemon_show_repository.dart';

class PokemonShowRepositoryImpl implements PokemonShowRepository {

  final PokemonShowDataSource dataSource;

  PokemonShowRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, ShowPokemonResponse>> getPokemonInformation({required int id}) async {
    try {
      final model = await dataSource.getPokemonInformation(id: id);
      return Right(model.toEntity());
    } on UnknownException catch (e) {
      return Left(GenericFailure(e.message));
    }
    catch (_) {
      return Left(GenericFailure("Ha ocurrido un error"));
    }
  }

  @override
  Future<Either<Failure, DetailsPokemonResponse>> getPokemonDescription({required int id}) async {
    try {
      final model = await dataSource.getPokemonDescription(id: id);
      return Right(model.toEntity());
    } on UnknownException catch (e) {
      return Left(GenericFailure(e.message));
    }
    catch (_) {
      return Left(GenericFailure("Ha ocurrido un error"));
    }
  }
}