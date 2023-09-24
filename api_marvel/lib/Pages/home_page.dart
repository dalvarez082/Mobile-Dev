import 'package:api_marvel/Widgets/Item_card_charter.dart';
import 'package:api_marvel/marvel_character.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';



class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<MarvelCharacter> characters = [];

  @override
  void initState() {
    super.initState();
    fetchMarvelCharacters();
  }

  Future<void> fetchMarvelCharacters() async {
    const publicKey = 'ad6bdd113a25813549da8c25b33f1997'; // Tu clave pública
    const privateKey = 'aa1ed69b8b152b4a208a17722aa2184abdfae3c9'; // Tu clave privada
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = generateMd5('$timestamp$privateKey$publicKey');
    const apiUrl = 'https://gateway.marvel.com/v1/public/characters';

    Map<String, String> queryParams = {
      'ts': timestamp,
      'apikey': publicKey,
      'hash': hash,
    };

    String queryString = Uri(queryParameters: queryParams).query;
   
    
    final response = await http.get(Uri.parse('$apiUrl?$queryString'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final charactersData = data['data']['results'];

      setState(() {
        characters = charactersData
            .map<MarvelCharacter>(
                (characterData) => MarvelCharacter.fromJson(characterData))
            .toList();
      });
    } else {
      // Manejo de errores, por ejemplo, mostrar un mensaje de error
      //print('Error al obtener los personajes de Marvel');
    }
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (BuildContext context, int index) {
          final character = characters[index];
          return ItemCardCharter(title: character.name, image: character.image);
        },
     ),
);
}
}
