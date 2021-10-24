import 'package:flutter/material.dart';
import 'package:pokedex/widgets/Pokedex.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pokedex(
        child: Container(),
      ),
    );

  }
}