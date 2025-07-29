import 'package:flutter/material.dart';
import 'package:tesys21_test/src/features/pokemon_list/domain/entities/result.dart';

class PokemonCardWidget extends StatelessWidget {

  final Result pokemon;

  const PokemonCardWidget({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = pokemon.url;
    final String? name = pokemon.name;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GestureDetector(
        child: Column(
          children: [
            if (imageUrl != null && imageUrl.isNotEmpty) ... [
              SizedBox(
                height: 120,
                child: Center(
                  child: Text("data")/*CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(strokeWidth: 2),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
                    fit: BoxFit.contain,
                  )*/,
                ),
              )
            ],

            if (name != null && name.isNotEmpty) ... [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}