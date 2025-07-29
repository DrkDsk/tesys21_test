import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_bloc.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_event.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_state.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/widgets/pokemon_card_widget.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  late PokemonListBloc pokemonListBloc;
  int _currentPage = 0;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    pokemonListBloc = context.read<PokemonListBloc>();
    Future.microtask(() {
      _handleFetchPokemons(page: _currentPage);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _handleFetchPokemons({required int page}) async {
    pokemonListBloc.add(FetchPokemonEvent(offset: page));
  }

  void _loadPage(int page) {
    _handleFetchPokemons(page: page);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Pokédex")),
      body: Column(
        children: [
          Expanded(child: BlocBuilder<PokemonListBloc, PokemonListState>(
              builder: (context, state) {
            if (state is PokemonLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PokemonListSuccessState) {
              final pokemonList = state.pokemonResult;
              return GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(bottom: 24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: pokemonList.length,
                itemBuilder: (context, index) {
                  final currentPokemon = pokemonList[index];
                  return PokemonCardWidget(pokemon: currentPokemon);
                },
              );
            }

            if (state is PokemonErrorState) {
              return Center(child: Text(state.message));
            }

            return const SizedBox.shrink();
          })),
          Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<PokemonListBloc, PokemonListState>(
              builder: (context, state) {
                final hasNext = state is PokemonListSuccessState ? state.hasReachedEnd : true;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _currentPage > 0
                          ? () {
                              setState(() => _currentPage--);
                              _loadPage(_currentPage);
                            }
                          : null,
                      child: const Icon(Icons.arrow_back),
                    ),
                    Text('Página ${_currentPage + 1}'),
                    ElevatedButton(
                      onPressed: hasNext
                          ? () {
                              setState(() => _currentPage++);
                              _loadPage(_currentPage);
                            }
                          : null,
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
