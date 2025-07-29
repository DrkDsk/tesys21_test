class Result {
  Result({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Result copyWith({
    String? name,
    String? url,
  }) {
    return Result(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}