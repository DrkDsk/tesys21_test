
import 'package:tesys21_test/src/features/pokemon_details/data/models/species_model.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/entities/move.dart';

class MoveModel {
  MoveModel({
    required this.move,
  });

  final SpeciesModel? move;

  MoveModel copyWith({
    SpeciesModel? move,
  }) {
    return MoveModel(
      move: move ?? this.move,
    );
  }

  factory MoveModel.fromJson(Map<String, dynamic> json){
    return MoveModel(
      move: json["move"] == null ? null : SpeciesModel.fromJson(json["move"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "move": move?.toJson(),
  };

  Move toEntity() {
    return Move(move: move?.toEntity());
  }

}