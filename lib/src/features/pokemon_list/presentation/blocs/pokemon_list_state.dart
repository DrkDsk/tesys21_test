import 'package:flutter/material.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/entities/result.dart';

@immutable
sealed class PokemonListState {}

final class PokemonListInitial extends PokemonListState {}

final class PokemonLoadingState extends PokemonListState{}

final class PokemonErrorState extends PokemonListState {
  final String message;

  PokemonErrorState({required this.message});
}

final class PokemonListSuccessState extends PokemonListState {
  final List<Result> pokemonResult;
  /*final int offset;
  final int limit;
  final String? next;
  final String? previous;*/

  PokemonListSuccessState({required this.pokemonResult/*, required this.offset, required this.limit, */});
}
