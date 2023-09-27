import 'package:api_marvel/Widgets/details_charter_section.dart';
import 'package:api_marvel/marvel_character.dart';
import 'package:flutter/material.dart';

class OneCharterPage extends StatelessWidget {
  final MarvelCharacter character;

  const OneCharterPage({
    Key? key,
    required this.character,
  }) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: AspectRatio(
                aspectRatio: 16 / 12,
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 8.0), // Espacio entre la imagen y el título
                Text(
                  character.name,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xFFF11E22),
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Marvel',
                  ),
                ),
                CharacterDetailsSection(character: character),
              ],
            ),
          ),
        ],
      ),
    );
  }



}


