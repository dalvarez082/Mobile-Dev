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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 12,
                    child: Image.network(
                      character.image, // Utiliza la imagen del personaje
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    character.name, // Utiliza el nombre del personaje
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Color(0xFFF11E22),
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Marvel',
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).padding.top +
                        MediaQuery.of(context).padding.bottom) -
                    360.0,
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0),
                      child: Text(
                        character.description, // Utiliza la descripción del personaje
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
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
                    // Agrega aquí la lista de series del personaje si es necesario
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}