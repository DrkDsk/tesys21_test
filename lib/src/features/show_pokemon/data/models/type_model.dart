import 'package:tesys21_test/src/features/show_pokemon/data/models/species_model.dart';
import 'package:tesys21_test/src/features/show_pokemon/domain/entities/type.dart';

class TypeModel {
  TypeModel({
    required this.slot,
    required this.type,
  });

  final int? slot;
  final SpeciesModel? type;

  TypeModel copyWith({
    int? slot,
    SpeciesModel? type,
  }) {
    return TypeModel(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  factory TypeModel.fromJson(Map<String, dynamic> json){
    return TypeModel(
      slot: json["slot"],
      type: json["type"] == null ? null : SpeciesModel.fromJson(json["type"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type?.toJson(),
  };

  Type toEntity() {
    return Type(slot: slot, type: type?.toEntity());
  }
}