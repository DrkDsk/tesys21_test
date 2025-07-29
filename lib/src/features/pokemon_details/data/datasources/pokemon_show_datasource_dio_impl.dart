import 'package:dio/dio.dart';
import 'package:tesys21_test/src/core/error/exceptions/server_exception.dart';
import 'package:tesys21_test/src/core/error/exceptions/unknown_exception.dart';
import 'package:tesys21_test/src/core/extensions/dio_extension.dart';
import 'package:tesys21_test/src/features/pokemon_details/data/models/details_pokemon_response_model.dart';
import 'package:tesys21_test/src/features/pokemon_details/data/models/show_pokemon_response_model.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/datasources/pokemon_show_datasource.dart';

class PokemonShowDataSourceDioImpl implements PokemonShowDataSource {

  final Dio dio;

  PokemonShowDataSourceDioImpl({required this.dio});

  @override
  Future<ShowPokemonResponseModel> getPokemonInformation({required int id}) async {
    try {
      final response = await dio.get('/pokemon/$id');

      return ShowPokemonResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(message: e.userFriendlyMessage);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  @override
  Future<DetailsPokemonResponseModel> getPokemonDescription({required int id}) async {
    try {
      final response = await dio.get('/pokemon-species/$id');

      return DetailsPokemonResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(message: e.userFriendlyMessage);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }
}