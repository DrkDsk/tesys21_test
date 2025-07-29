import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesys21_test/src/core/extensions/int_extension.dart';
import 'package:tesys21_test/src/core/extensions/string_extension.dart';
import 'package:tesys21_test/src/core/shared/ui/widgets/image_network_widget.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/blocs/pokemon_show_bloc.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/blocs/pokemon_show_event.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/blocs/pokemon_show_state.dart';
import 'package:tesys21_test/src/features/pokemon_details/presentation/widgets/base_stats_container_widget.dart';

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
    final theme = Theme.of(context);

    return BlocBuilder<PokemonShowBloc, PokemonShowState>(
      builder: (context, state) {
        Widget bodyWidget = const SizedBox.shrink();
        Color? backgroundColor = Colors.amber.shade100;

        if (state is PokemonShowLoadingState) {
          backgroundColor = Colors.amber.shade100;
          bodyWidget = const Center(child: CircularProgressIndicator());
        }

        if (state is PokemonShowErrorState) {
          backgroundColor = Colors.red.shade100;
          bodyWidget = Center(child: Text(state.message));
        }

        if (state is PokemonShowSuccessState) {
          final response = state.response;
          final name = response.name;
          final id = response.id;
          final types = response.types;

          backgroundColor = state.color?.name?.toColor;

          bodyWidget = Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back)),
                    const SizedBox(width: 12),
                    if (name != null) ...[
                      Text(
                        name.capitalizeFirst(),
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                    const Spacer(),
                    if (id != null) ...[
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
                  Column(
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          shape: BoxShape.circle,
                        ),
                        child: ImageNetworkWidget(
                            imageUrl: response.sprites?.frontDefault),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...types.map((type) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Chip(
                                    label: Text(
                                      type.type?.name?.capitalizeFirst() ??
                                          "",
                                      style: theme.textTheme.bodyMedium,
                                    )
                                ),
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
                        Center(
                          child: Text(
                            'Acerca de',
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.monitor_weight),
                                Text('${response.weight.toKilograms()} kg', style: theme.textTheme.bodySmall),
                                Text('Peso', style: theme.textTheme.bodyMedium),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.height),
                                Text('${response.height.toMeters()} m', style: theme.textTheme.bodySmall),
                                Text('Altura', style: theme.textTheme.bodyMedium),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.flash_on),
                                ...response.abilities
                                    .where((ability) =>
                                        ability.ability?.name != null)
                                    .map((ability) {
                                  return Text(
                                      ability.ability?.name
                                          ?.capitalizeFirst() ??
                                      "",
                                  style: theme.textTheme.bodyMedium);
                                }),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "${state.description?.cleanNewlines()}",
                          style: theme.textTheme.bodySmall?.copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        BaseStatsContainerWidget(tile: "Estadísticas Base", response: response)
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }

        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(child: bodyWidget),
        );
      },
    );
  }
}
