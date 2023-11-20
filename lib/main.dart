import 'package:flutter/material.dart';
import 'package:pokedex/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex Test',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.redAccent.shade700),
          useMaterial3: true,
        ),
        home: const PokedexPage());
  }
}
