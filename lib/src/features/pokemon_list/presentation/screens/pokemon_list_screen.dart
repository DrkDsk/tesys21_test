import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesys21_test/src/core/shared/ui/widgets/elevated_button_widget.dart';
import 'package:tesys21_test/src/core/shared/ui/widgets/menu_app_bar.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_bloc.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_event.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_state.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/widgets/pokemon_grid_widget.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  late PokemonListBloc pokemonListBloc;

  @override
  void initState() {
    super.initState();
    pokemonListBloc = context.read<PokemonListBloc>();
    Future.microtask(() {
      _handleFetchPokemon();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _handleFetchPokemon({int page = 0}) async {
    pokemonListBloc.add(FetchPokemonEvent(page: page));
  }

  void _loadPage(int page) {
    _handleFetchPokemon(page: page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(),
      body: Column(
        children: [
          Expanded(child: BlocBuilder<PokemonListBloc, PokemonListState>(
              builder: (context, state) {
            if (state is PokemonLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PokemonListSuccessState) {
              final pokemonList = state.displayedPokemons;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: PokemonGridWidget(pokemonList: pokemonList),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
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
                final theme = Theme.of(context);

                if (state is PokemonListSuccessState) {
                  final currentPage = state.currentPage;
                  final hasNext = state.hasReachedEnd;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButtonWidget(
                        onPressed: currentPage > 0
                            ? () => _loadPage(currentPage - 1)
                            : null,
                        iconData: Icons.arrow_back,
                      ),
                      Text('Página ${currentPage + 1}'),
                      ElevatedButtonWidget(
                        onPressed: hasNext
                            ? () {
                                _loadPage(currentPage + 1);
                              }
                            : null,
                        iconData: Icons.arrow_forward,
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          )
        ],
      ),
    );
  }
}
