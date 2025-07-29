import 'package:flutter/material.dart';

@immutable
sealed class PokemonListEvent {}

class FetchPokemonEvent extends PokemonListEvent {
  final int page;
  final int limit;

  FetchPokemonEvent({this.page = 0, this.limit = 10});
}
