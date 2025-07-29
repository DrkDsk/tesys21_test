import 'package:get_it/get_it.dart';
import 'package:tesys21_test/src/core/dio/dio_client.dart';
import 'package:tesys21_test/src/features/pokemon_list/data/datasources/pokemon_list_datasource_dio_impl.dart';
import 'package:tesys21_test/src/features/pokemon_list/data/repositories/pokemon_list_repository_impl.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/datasources/pokemon_list_datasource.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_bloc.dart';

final getIt = GetIt.instance;

Future<void> initBlocDependencies() async {
  final dioClient = DioClient();

  getIt.registerSingleton(dioClient);

  //DataSources
  getIt.registerLazySingleton<PokemonListDataSource>(() => PokemonListDataSourceDioImpl(dio: dioClient.dio));

  //repositories
  getIt.registerLazySingleton<PokemonListRepository>(() => PokemonListRepositoryImpl(dataSource: getIt<PokemonListDataSource>()));

  //blocs
  getIt.registerFactory<PokemonListBloc>(() => PokemonListBloc(repository: getIt<PokemonListRepository>()));
}