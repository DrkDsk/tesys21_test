import 'package:bloc/bloc.dart';
import 'package:tesys21_test/src/features/pokemon_details/domain/repositories/pokemon_show_repository.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/blocs/pokemon_show_event.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/blocs/pokemon_show_state.dart';

class PokemonShowBloc extends Bloc<PokemonShowEvent, PokemonShowState> {
  final PokemonShowRepository repository;

  PokemonShowBloc({required this.repository}) : super(PokemonShowInitial()) {
    on<PokemonShowFetchEvent>(_fetchShowPokemon);
  }

  Future<void> _fetchShowPokemon(
      PokemonShowFetchEvent event, Emitter<PokemonShowState> emit) async {
    final int id = event.id;

    emit(PokemonShowLoadingState());

    final resultEither = await repository.getPokemon(id: id);

    resultEither.fold(
      (left) => emit(PokemonShowErrorState(message: left.message)),
      (right) {
        emit(PokemonShowSuccessState(response: right));
      },
    );
  }
}
