import 'package:tesys21_test/src/core/dio/dio_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:tesys21_test/src/features/pokemon_list/data/datasources/pokemon_list_datasource_dio_impl.dart';
import 'package:tesys21_test/src/features/pokemon_list/data/models/result_model.dart';

void main() {
  late DioClient dioClient;
  late DioAdapter dioAdapter;
  late PokemonListDataSourceDioImpl datasource;

  setUp( () {
    dioClient = DioClient();
    var dio = dioClient.dio;
    dioAdapter = DioAdapter(dio: dio);
    datasource = PokemonListDataSourceDioImpl(dio: dio);
  });
  
  test("test debería retornar el modelo si la respuesta es exitosa (200) ", () async {

    const offset = 0;
    const limit = 10;

    const fakeResults = [
      {
        "name": "bulbasaur",
        "url": "https://pokeapi.co/api/v2/pokemon/1/"
      },
      {
        "name": "ivysaur",
        "url": "https://pokeapi.co/api/v2/pokemon/2/"
      },
      {
        "name": "venusaur",
        "url": "https://pokeapi.co/api/v2/pokemon/3/"
      },
      {
        "name": "charmander",
        "url": "https://pokeapi.co/api/v2/pokemon/4/"
      },
      {
        "name": "charmeleon",
        "url": "https://pokeapi.co/api/v2/pokemon/5/"
      }
    ];

    const fakeJson = {
      "count": 1302,
      "next": "https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=$limit",
      "previous": null,
      "results": fakeResults
    };

    dioAdapter.onGet(
      '/pokemon',
      queryParameters: {'limit': '$limit', 'offset': '$offset'},
          (server) => server.reply(200, fakeJson),
    );

    final result = await datasource.getPokemonList(offset: offset, limit: limit);

    final expectedResults = fakeResults
        .map((e) => ResultModel(name: e['name']!, url: e['url']!))
        .toList();

    expect(result.count, 1302);
    expect(result.next, isNotNull);
    expect(result.results, equals(expectedResults));
  });
}