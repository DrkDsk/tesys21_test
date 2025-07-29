import 'package:bloc/bloc.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_event.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonListRepository repository;

  PokemonListBloc({required this.repository}) : super(PokemonListInitial()) {
    on<FetchPokemonEvent>(_getPokemonList);
  }

  Future<void> _getPokemonList(
      FetchPokemonEvent event, Emitter<PokemonListState> emit) async {
    final int limit = event.limit;
    final int page = event.page;
    final int offset = page * event.limit;

    final resultEither =
        await repository.getPokemonList(offset: offset, limit: limit);

    resultEither.fold(
      (left) => emit(PokemonErrorState(message: left.message)),
      (right) {
        final bool hasNext = right.results.length == limit;
        emit(PokemonListSuccessState(pokemonResult: right.results, hasReachedEnd: hasNext, currentPage: page));
      },
    );
  }
}
