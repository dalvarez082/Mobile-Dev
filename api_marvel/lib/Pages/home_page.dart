import 'package:api_marvel/Widgets/Item_card_charter.dart';
import 'package:api_marvel/Widgets/banner_charter.dart';
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


  String removeParentheses(String text) {
  // Find the first occurrence of "(" and the last occurrence of ")"
  final startIndex = text.indexOf("(");
  final endIndex = text.lastIndexOf(")");

  
  if (startIndex != -1 && endIndex != -1 && startIndex < endIndex) {
    // Remove the text between parentheses and the parentheses themselves
    return text.replaceRange(startIndex, endIndex + 1, '').trim();
  } else {
    // If no parentheses are found, return the original text
    return text;
  }
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            expandedHeight: 100.0, // Altura expandida de la AppBar
            backgroundColor: Colors.black, // Color de fondo de la AppBar
            flexibleSpace: FlexibleSpaceBar(
              background: BanerCharter(), // Aquí utilizas el widget BannerCharter
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0), // Espacio en blanco en la parte superior
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final character = characters[index];
                  return ItemCardCharter(
                    title: removeParentheses(character.name), 
                    image: character.image, 
                    comicsCount: character.comicsCount.toString(),
                    seriesCount: character.seriesCount.toString(),
                    storiesCount: character.storiesCount.toString(),
                    eventsCount: character.eventsCount.toString(),
                  );
                },
                childCount: characters.length,
              ),
            ),
          ),
        ],
      ),
    );
  }




}
