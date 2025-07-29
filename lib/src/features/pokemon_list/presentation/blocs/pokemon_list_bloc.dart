import 'package:bloc/bloc.dart';
import 'package:tesys21_test/src/core/constants/int_constants.dart';
import 'package:tesys21_test/src/core/enum/sort_option.dart';
import 'package:tesys21_test/src/features/pokemon_list/data/repositories/sort_by_id_impl.dart';
import 'package:tesys21_test/src/features/pokemon_list/data/repositories/sort_by_name_impl.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/repositories/pokemon_sort_strategy.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_event.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonListRepository repository;

  PokemonListBloc({required this.repository}) : super(PokemonListInitial()) {
    on<FetchPokemonEvent>(_getPokemonList);
    on<SortPokemonEvent>(_onSortPokemonList);
    on<SearchPokemonEvent>(_onSearchPokemon);
  }

  Future<void> _getPokemonList(
    FetchPokemonEvent event,
    Emitter<PokemonListState> emit,
  ) async {
    final int limit = event.limit;
    final int page = event.page;
    final int offset = page * event.limit;

    final resultEither =
        await repository.getPokemonList(offset: offset, limit: limit);

    resultEither.fold(
      (left) => emit(PokemonErrorState(message: left.message)),
      (right) {
        final currentState = state;

        //Antes de emitir un nuevo estado, obtiene
        // el valor de ordenamiento actual y lo aplica en el strategy
        final currentSort = currentState is PokemonListSuccessState
            ? currentState.currentSort
            : SortOption.id;

        //obtiene la lista ordenada dependiendo del valor de la opción y
        //y lo aplica al resultado del repository
        final sortedList = getSortStrategy(currentSort).sort(right.results);

        final int visibleItemCount = (page + 1) * limit;
        final displayed = sortedList.take(visibleItemCount).toList();

        final bool hasNext = right.results.length == limit;

        emit(PokemonListSuccessState(
          pokemonResult: sortedList,
          displayedPokemons: displayed,
          currentPage: page,
          currentSort: currentSort,
          hasReachedEnd: hasNext,
        ));
      },
    );
  }

  Future<void> _onSortPokemonList(
    SortPokemonEvent event,
    Emitter<PokemonListState> emit,
  ) async {
    final currentState = state;

    if (currentState is PokemonListSuccessState) {

      final strategy = getSortStrategy(event.option);

      final sortedList = strategy.sort(currentState.pokemonResult);

      final int visibleItemCount = (currentState.currentPage + 1) * kDefaultPokemonPageLimit;

      final displayed = sortedList.take(visibleItemCount).toList();

      emit(currentState.copyWith(
        pokemonResult: sortedList,
        displayedPokemons: displayed,
        currentSort: event.option,
      ));
    }
  }

  Future<void> _onSearchPokemon(
      SearchPokemonEvent event,
      Emitter<PokemonListState> emit,
      ) async {
    final currentState = state;


    if (currentState is PokemonListSuccessState) {
      final query = event.query.trim().toLowerCase();


      final filtered = currentState.pokemonResult.where((pokemon) {
        final name = pokemon.name;


        if (name == null) {
          return false;
        }

        return name.toLowerCase().contains(query);
      }).toList();

      emit(currentState.copyWith(
        displayedPokemons: filtered,
        searchQuery: query,
      ));
    }
  }

  PokemonSortStrategy getSortStrategy(SortOption option) {
    switch (option) {
      case SortOption.name:
        return SortByNameImpl();
      case SortOption.id:
        return SortByIdImpl();
    }
  }
}
