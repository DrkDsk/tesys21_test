import 'package:tesys21_test/src/features/pokemon_list/domain/entities/result.dart';

class PokemonListResponse {
  PokemonListResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<Result> results;

  PokemonListResponse copyWith({
    int? count,
    String? next,
    String? previous,
    List<Result>? results,
  }) {
    return PokemonListResponse(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }
}
