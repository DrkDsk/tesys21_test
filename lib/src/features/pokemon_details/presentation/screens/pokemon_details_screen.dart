import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesys21_test/src/core/extensions/int_extension.dart';
import 'package:tesys21_test/src/core/extensions/string_extension.dart';
import 'package:tesys21_test/src/core/shared/ui/widgets/image_network_widget.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/blocs/pokemon_show_bloc.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/blocs/pokemon_show_event.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/blocs/pokemon_show_state.dart';

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

          if (state is PokemonShowSuccessState) {
            final response = state.response;
            final name = response.name;
            final id = response.id;
            final types = response.types;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back),
                      const SizedBox(width: 12),
                      if (name != null) ... [
                        Text(
                          name.capitalizeFirst(),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )
                      ],
                      const Spacer(),
                      if (id != null) ... [
                        Text(
                          '#$id',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned(
                      left: 16,
                      child: Icon(Icons.chevron_left),
                    ),
                    const Positioned(
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
                          child: ImageNetworkWidget(imageUrl: response.sprites?.frontDefault),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...types.map((type) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Chip(label: Text(type.type?.name?.capitalizeFirst() ?? "")),
                            )),
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
                      boxShadow: const [
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
                              'Acerca de',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Icon(Icons.monitor_weight),
                                  Text('${response.weight.toKilograms()} kg'),
                                  const Text('Peso'),
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(Icons.height),
                                  Text('${response.height.toMeters()} m'),
                                  const Text('Altura'),
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(Icons.flash_on),
                                  ...response.abilities.where((ability) => ability.ability?.name != null).map((ability) {
                                    return Text(ability.ability?.name?.capitalizeFirst() ?? "");
                                  }),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc iaculis eros vitae tellus condimentum maximus sit amet in eros.',
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: Text(
                              'Estadísticas Base',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[500]),
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...response.stats.map(
                                (stat) {
                                  final statName = stat.stat?.name;
                                  final baseStat = stat.baseStat ?? 0;
                                  final baseStateValue = baseStat / 255;

                                  return Column(
                                    children: [
                                      if (statName != null && statName.isNotEmpty) ... [
                                        Row(
                                          children: [
                                            SizedBox(width: 40, child: Text(statName)),
                                            const SizedBox(width: 8),
                                            Text("$baseStat"),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: LinearProgressIndicator(
                                                value: baseStateValue, // 0.45
                                                minHeight: 6,
                                                backgroundColor: Colors.grey.shade300,
                                                valueColor: AlwaysStoppedAnimation(baseStateValue.statColor),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                      const SizedBox(height: 8),
                                    ],
                                  );
                                },
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }

          return const SizedBox.shrink();
        },
      )),
    );
  }
}
