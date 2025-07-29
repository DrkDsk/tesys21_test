class Result {
  Result({
    required this.name,
    required this.url,
    required this.id
  });

  final String? name;
  final String? url;
  final String id;

  Result copyWith({
    String? name,
    String? url,
    String? id
  }) {
    return Result(
      name: name ?? this.name,
      url: url ?? this.url,
      id : id ?? this.id
    );
  }
}