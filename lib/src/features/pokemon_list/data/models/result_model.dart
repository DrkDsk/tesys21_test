import 'package:tesys21_test/src/features/pokemon_list/domain/entities/result.dart';

class ResultModel {
  ResultModel({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  ResultModel copyWith({
    String? name,
    String? url,
  }) {
    return ResultModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };

  Result toEntity() {
    return Result(name: name, url: url);
  }
}