import 'package:tesys21_test/src/core/helpers/image_helper.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/entities/result.dart';

class ResultModel {
  ResultModel({
    required this.name,
    required this.url,
    required this.id
  });

  final String? name;
  final String? url;
  final String id;

  ResultModel copyWith({
    String? name,
    String? url,
    String? id,
  }) {
    return ResultModel(
      name: name ?? this.name,
      url: url ?? this.url,
      id: id ?? this.id
    );
  }

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    final url = json["url"];
    return ResultModel(
      name: json["name"],
      url: json["url"],
      id: ImageHelper.extractIdFromUrl(url) ?? ""
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "id" : id
  };

  Result toEntity() {
    return Result(
      name: name,
      url: url,
      id: id
    );
  }
}