class ColorEntity {
  ColorEntity({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  ColorEntity copyWith({
    String? name,
    String? url,
  }) {
    return ColorEntity(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
