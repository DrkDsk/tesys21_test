import 'package:flutter/material.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/color_entity.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/show_pokemon_response.dart';

@immutable
sealed class PokemonShowState {}

final class PokemonShowInitial extends PokemonShowState {}

final class PokemonShowSuccessState extends PokemonShowState {
  final ShowPokemonResponse response;
  final String? description;
  final ColorEntity? color;

  PokemonShowSuccessState({required this.response, required this.description, required this.color});
}

final class PokemonShowLoadingState extends PokemonShowState {}

final class PokemonShowErrorState extends PokemonShowState {
  final String message;

  PokemonShowErrorState({required this.message});
}