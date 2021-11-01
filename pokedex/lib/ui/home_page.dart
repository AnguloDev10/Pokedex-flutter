import 'package:flutter/material.dart';
import 'package:pokedex/widgets/Pokedex.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pokedex(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: 
                Pokemon_Card(),
            ),
            
          ],
        ),
      ),
    );

  }
}