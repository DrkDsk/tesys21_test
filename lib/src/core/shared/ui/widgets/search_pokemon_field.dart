import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_bloc.dart';
import 'package:tesys21_test/src/features/pokemon_list/presentation/blocs/pokemon_list_event.dart';

class SearchPokemonField extends StatelessWidget {
  const SearchPokemonField({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return TextField(
      style: theme.textTheme.bodyMedium,
      onChanged: (value) => BlocProvider.of<PokemonListBloc>(context)
          .add(SearchPokemonEvent(query: value)),
      decoration: InputDecoration(
        hintStyle: theme.textTheme.bodyMedium,
        hintText: 'Buscar Pokemon',
        border: InputBorder.none,
        isDense: true,
      ),
    );
  }
}
