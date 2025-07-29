import 'package:flutter/material.dart';
import 'package:tesys21_test/src/core/enum/sort_option.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/entities/result.dart';

@immutable
sealed class PokemonListState {}

final class PokemonListInitial extends PokemonListState {}

final class PokemonLoadingState extends PokemonListState {}

final class PokemonErrorState extends PokemonListState {
  final String message;

  PokemonErrorState({required this.message});
}

final class PokemonListSuccessState extends PokemonListState {
  final List<Result> pokemonResult;
  final List<Result> displayedPokemons;
  final int currentPage;
  final bool hasReachedEnd;
  final SortOption currentSort;

  PokemonListSuccessState({
    required this.pokemonResult,
    required this.displayedPokemons,
    required this.currentPage,
    required this.currentSort,
    this.hasReachedEnd = false,
  });

  PokemonListSuccessState copyWith({
    List<Result>? pokemonResult,
    List<Result>? displayedPokemons,
    int? currentPage,
    bool? hasReachedEnd,
    SortOption? currentSort,
  }) {
    return PokemonListSuccessState(
      pokemonResult: pokemonResult ?? this.pokemonResult,
      displayedPokemons: displayedPokemons ?? this.displayedPokemons,
      currentPage: currentPage ?? this.currentPage,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentSort: currentSort ?? this.currentSort,
    );
  }
}
