import 'package:flutter/material.dart';
import 'package:tesys21_test/src/core/helpers/theme_helper.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/screens/pokemon_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeHelper.getThemeData(context: context),
      home: const PokemonListScreen(),
    );
  }
}