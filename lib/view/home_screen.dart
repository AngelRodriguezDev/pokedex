import 'package:flutter/material.dart';
import 'package:pokedex/controller/pokedex_controller.dart';
import 'package:provider/provider.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  @override
  Widget build(BuildContext context) {
    int countPokedex = context.watch<PokedexController>().pokeTeamCount;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/pokeball.png",
                ),
              ),
              Text(countPokedex.toString(),
                  style: TextStyle(
                      fontSize: 28,
                      shadows: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(3, 3),
                        ),
                      ],
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          )
        ],
        title: Text("POKEDEX"),
        backgroundColor: Colors.redAccent.shade700,
        foregroundColor: Colors.white,
      ),
    );
  }
}
