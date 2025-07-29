import 'package:tesys21_test/src/features/show_pokemon/domain/entities/species.dart';

class Move {
  Move({
    required this.move,
  });

  final Species? move;

  Move copyWith({
    Species? move,
  }) {
    return Move(
      move: move ?? this.move,
    );
  }
}