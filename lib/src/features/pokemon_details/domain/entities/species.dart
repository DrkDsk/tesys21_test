class Species {
  Species({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Species copyWith({
    String? name,
    String? url,
  }) {
    return Species(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

}