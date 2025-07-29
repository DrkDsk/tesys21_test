import 'package:equatable/equatable.dart';
import 'package:tesys21_test/src/features/pokemon_list/data/models/result_model.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/entities/pokemon_list_response.dart';

class PokemonListResponseModel  with EquatableMixin {
  final int? count;
  final String? next;
  final String? previous;
  final List<ResultModel> results;

  PokemonListResponseModel(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});

  factory PokemonListResponseModel.fromJson(Map<String, dynamic> json) {
    return PokemonListResponseModel(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: json["results"] == null ? [] : List<ResultModel>.from(json["results"]!.map((x) => ResultModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": results.map((x) => x.toJson()).toList(),
  };

  PokemonListResponseModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<ResultModel>? results,
  }) {
    return PokemonListResponseModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  PokemonListResponse toEntity() {
    return PokemonListResponse(
        count: count, next: next, previous: previous, results: results.map((x) => x.toEntity()).toList());
  }

  @override
  List<Object?> get props => [results];
}
