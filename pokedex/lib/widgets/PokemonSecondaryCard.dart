import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/ui/capture_photo.dart';
import 'package:pokedex/ui/detection_page.dart';
import 'package:pokedex/ui/flutter_dex.dart';
import 'package:pokedex/utils/colors.dart';

class PokemonSecondaryCard extends StatelessWidget {
  final String link;
  PokemonSecondaryCard(this.link);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CamerPicker(),
          ),
        );
      },
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [lightBlue0, lightBlue]),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Image.network(
                  'https://i.imgur.com/' + link,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
