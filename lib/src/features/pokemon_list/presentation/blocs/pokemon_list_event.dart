import 'package:flutter/material.dart';

@immutable
sealed class PokemonListEvent {}

class FetchPokemonEvent extends PokemonListEvent {
  final int offset;
  final int limit;

  FetchPokemonEvent({this.offset = 0, this.limit = 10});
}
