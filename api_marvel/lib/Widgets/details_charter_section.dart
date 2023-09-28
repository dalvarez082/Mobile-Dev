import 'package:api_marvel/Widgets/Item_car_series_charter.dart';
import 'package:flutter/material.dart';
import 'package:api_marvel/marvel_character.dart';

class CharacterDetailsSection extends StatelessWidget {
  final MarvelCharacter character;

  const CharacterDetailsSection({
    Key? key,
    required this.character,
  }) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Descripción',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'Marvel',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              character.description, // Utiliza la descripción del personaje
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Series',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'Marvel',
              ),
            ),
          ),
          SizedBox(
            height: 150.0, // Altura de la lista horizontal
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: character.firstThreeSeries.length,
              itemBuilder: (context, index) {
                // Aquí puedes personalizar el diseño de cada tarjeta (card)
                return ItemCardSerieCharter(
                  title: character.firstThreeSeries[index].name,);
                  
                  
              },
            ),
          ),
        ],
      ),
    );
  }


}
