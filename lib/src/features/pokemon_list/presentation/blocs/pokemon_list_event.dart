import 'package:flutter/material.dart';

@immutable
sealed class PokemonListEvent {}

class GetPokemonListEvent extends PokemonListEvent {
  final int offset;
  final int limit;

  GetPokemonListEvent({required this.offset, this.limit = 10});
}
