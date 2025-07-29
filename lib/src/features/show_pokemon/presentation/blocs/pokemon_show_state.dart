import 'package:flutter/material.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/entities/show_pokemon_response.dart';

@immutable
sealed class PokemonShowState {}

final class PokemonShowInitial extends PokemonShowState {}

final class PokemonShowSuccessState extends PokemonShowState {
  final ShowPokemonResponse response;

  PokemonShowSuccessState({required this.response});
}

final class PokemonShowLoadingState extends PokemonShowState {}

final class PokemonShowErrorState extends PokemonShowState {
  final String message;

  PokemonShowErrorState({required this.message});
}