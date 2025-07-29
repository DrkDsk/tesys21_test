import 'package:tesys21_test/src/features/pokemon_details/domain/entities/color_entity.dart';

class ColorEntityModel {
  ColorEntityModel({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  ColorEntityModel copyWith({
    String? name,
    String? url,
  }) {
    return ColorEntityModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  ColorEntity toEntity() {
    return ColorEntity(name: name, url: url);
  }

  factory ColorEntityModel.fromJson(Map<String, dynamic> json){
    return ColorEntityModel(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}