import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesys21_test/src/features/show_pokemon/presentation/blocs/pokemon_show_bloc.dart';
import 'package:tesys21_test/src/features/show_pokemon/presentation/blocs/pokemon_show_event.dart';
import 'package:tesys21_test/src/features/show_pokemon/presentation/blocs/pokemon_show_state.dart';

class PokemonDetailsScreen extends StatefulWidget {
  final int pokemonId;

  const PokemonDetailsScreen({super.key, required this.pokemonId});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  late PokemonShowBloc pokemonShowBloc;

  @override
  void initState() {
    super.initState();
    pokemonShowBloc = context.read<PokemonShowBloc>();
    Future.microtask(() {
      pokemonShowBloc.add(PokemonShowFetchEvent(id: widget.pokemonId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(child: BlocBuilder<PokemonShowBloc, PokemonShowState>(
        builder: (context, state) {
          if (state is PokemonShowLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PokemonShowErrorState) {
            return Center(child: Text(state.message));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back),
                    const SizedBox(width: 12),
                    const Text(
                      'Pokémon Name',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Text(
                      '#999',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 16,
                    child: Icon(Icons.chevron_left),
                  ),
                  Positioned(
                    right: 16,
                    child: Icon(Icons.chevron_right),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 180,
                        width: 180,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.pets, size: 100),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Chip(label: Text('Type')),
                          const SizedBox(width: 8),
                          Chip(label: Text('Type')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'About',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Column(
                              children: [
                                Icon(Icons.monitor_weight),
                                Text('9.9 kg'),
                                Text('Weight'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.height),
                                Text('9.9 m'),
                                Text('Height'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.flash_on),
                                Text('Ability 1'),
                                Text('Ability 2'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc iaculis eros vitae tellus condimentum maximus sit amet in eros.',
                        ),
                        const SizedBox(height: 16),
                        const Center(
                          child: Text(
                            'Base Stats',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...['HP', 'ATK', 'DEF', 'SATK', 'SDEF', 'SPD'].map(
                          (stat) => Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 40, child: Text(stat)),
                                  const SizedBox(width: 8),
                                  const Text('999'),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: 1.0,
                                      minHeight: 6,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      )),
    );
  }
}
