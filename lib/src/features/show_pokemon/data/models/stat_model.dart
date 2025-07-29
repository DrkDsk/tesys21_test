import 'package:tesys21_test/src/features/show_pokemon/data/models/species_model.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/entities/stat.dart';

class StatModel {
  StatModel({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int? baseStat;
  final int? effort;
  final SpeciesModel? stat;

  StatModel copyWith({
    int? baseStat,
    int? effort,
    SpeciesModel? stat,
  }) {
    return StatModel(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  Stat toEntity() {
    return Stat(baseStat: baseStat, effort: effort, stat: stat?.toEntity());
  }

  factory StatModel.fromJson(Map<String, dynamic> json){
    return StatModel(
      baseStat: json["base_stat"],
      effort: json["effort"],
      stat: json["stat"] == null ? null : SpeciesModel.fromJson(json["stat"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat?.toJson(),
  };
}