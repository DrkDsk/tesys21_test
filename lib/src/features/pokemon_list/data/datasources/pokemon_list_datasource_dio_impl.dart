import 'package:tesys21_test/src/core/error/exceptions/server_exception.dart';
import 'package:tesys21_test/src/core/error/exceptions/unknown_exception.dart';
import 'package:tesys21_test/src/core/extensions/dio_extension.dart';
import 'package:tesys21_test/src/features/pokemon_list/data/models/pokemon_list_response_model.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/datasources/pokemon_list_datasource.dart';

import 'package:dio/dio.dart';


class PokemonListDataSourceDioImpl implements PokemonListDataSource {

  final Dio dio;

  PokemonListDataSourceDioImpl({required this.dio});

  @override
  Future<PokemonListResponseModel> getPokemonList({required int offset, required int limit}) async {
    try {
      final response = await dio.get('/pokemon?limit=$limit&offset=$offset');

      return PokemonListResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(message: e.userFriendlyMessage);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

}