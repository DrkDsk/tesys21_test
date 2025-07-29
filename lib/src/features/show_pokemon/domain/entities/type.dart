import 'package:tesys21_test/src/features/show_pokemon/domain/entities/species.dart';

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int? slot;
  final Species? type;

  Type copyWith({
    int? slot,
    Species? type,
  }) {
    return Type(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }
}