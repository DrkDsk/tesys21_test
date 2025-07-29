import 'package:flutter/material.dart';
import 'package:tesys21_test/src/core/constants/int_constants.dart';
import 'package:tesys21_test/src/core/enum/sort_option.dart';

@immutable
sealed class PokemonListEvent {}

final class FetchPokemonEvent extends PokemonListEvent {
  final int page;
  final int limit;

  FetchPokemonEvent({this.page = 0, this.limit = kDefaultPokemonPageLimit});
}

final class SortPokemonEvent extends PokemonListEvent {
  final SortOption option;

  SortPokemonEvent(this.option);
}
