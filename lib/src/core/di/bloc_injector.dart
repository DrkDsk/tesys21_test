import 'package:get_it/get_it.dart';
import 'package:tesys21_test/src/core/dio/dio_client.dart';
import 'package:tesys21_test/src/features/pokemon_list/data/datasources/pokemon_list_datasource_dio_impl.dart';
import 'package:tesys21_test/src/features/pokemon_list/data/repositories/pokemon_list_repository_impl.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/datasources/pokemon_list_datasource.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_bloc.dart';
import 'package:tesys21_test/src/features/show_pokemon/data/datasources/pokemon_show_datasource_dio_impl.dart';
import 'package:tesys21_test/src/features/show_pokemon/data/repositories/pokemon_show_repository_impl.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/datasources/pokemon_show_datasource.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/repositories/pokemon_show_repository.dart';
import 'package:tesys21_test/src/features/show_pokemon/presentation/blocs/pokemon_show_bloc.dart';

final getIt = GetIt.instance;

Future<void> initBlocDependencies() async {
  final dioClient = DioClient();

  getIt.registerSingleton(dioClient);

  //DataSources
  getIt.registerLazySingleton<PokemonListDataSource>(() => PokemonListDataSourceDioImpl(dio: getIt<DioClient>().dio));
  getIt.registerLazySingleton<PokemonShowDataSource>(() => PokemonShowDataSourceDioImpl(dio: getIt<DioClient>().dio));

  //repositories
  getIt.registerLazySingleton<PokemonListRepository>(() => PokemonListRepositoryImpl(dataSource: getIt<PokemonListDataSource>()));
  getIt.registerLazySingleton<PokemonShowRepository>(() => PokemonShowRepositoryImpl(dataSource: getIt<PokemonShowDataSource>()));

  //blocs
  getIt.registerFactory<PokemonListBloc>(() => PokemonListBloc(repository: getIt<PokemonListRepository>()));
  getIt.registerFactory<PokemonShowBloc>(() => PokemonShowBloc(repository: getIt<PokemonShowRepository>()));
}