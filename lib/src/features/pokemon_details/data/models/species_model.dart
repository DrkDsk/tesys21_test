import 'package:tesys21_test/src/features/pokemon_details/domain/entities/species.dart';

class SpeciesModel {
  SpeciesModel({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  SpeciesModel copyWith({
    String? name,
    String? url,
  }) {
    return SpeciesModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory SpeciesModel.fromJson(Map<String, dynamic> json){
    return SpeciesModel(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };

  Species toEntity() {
    return Species(name: name, url: url);
  }
}