import 'package:flutter/material.dart';
import 'package:pokedex/utils/colors.dart';

class Pokemon_Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [lightBlue0, lightBlue]
        )
      ),
      child: Row(
        children: [
          Expanded(child: Image.network('https://i.imgur.com/NajAHs8.png'))
        ],
      ),
    );
  }
}