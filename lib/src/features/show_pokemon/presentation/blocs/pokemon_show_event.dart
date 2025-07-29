import 'package:flutter/material.dart';

@immutable
sealed class PokemonShowEvent {}

final class PokemonShowFetchEvent extends PokemonShowEvent {
  final int id;

  PokemonShowFetchEvent({required this.id});
}
