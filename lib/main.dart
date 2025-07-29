import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesys21_test/my_app.dart';
import 'package:tesys21_test/src/core/di/bloc_injector.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initBlocDependencies();

  runApp(MultiRepositoryProvider(
    providers: [
      BlocProvider(create: (_) => getIt<PokemonListBloc>()),
    ],
    child: const MyApp(),
  ));
}