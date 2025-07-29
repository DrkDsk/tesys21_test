import 'package:tesys21_test/src/features/show_pokemon/domain/entities/species.dart';

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int? baseStat;
  final int? effort;
  final Species? stat;

  Stat copyWith({
    int? baseStat,
    int? effort,
    Species? stat,
  }) {
    return Stat(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

}