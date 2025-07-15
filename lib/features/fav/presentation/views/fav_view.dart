import 'package:flutter/material.dart';
import 'widgets/fav_bloc_builder.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: const Column(
        children: [SizedBox(height: 10), Expanded(child: FavBlocBuilder())],
      ),
    );
  }
}
