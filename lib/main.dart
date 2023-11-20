import 'package:flutter/material.dart';
import 'package:pokedex/core/providers.dart';
import 'package:pokedex/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.list,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pokedex Test',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.redAccent.shade700),
            useMaterial3: true,
          ),
          home: const PokedexPage()),
    );
  }
}
