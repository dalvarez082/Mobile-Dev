import 'package:api_marvel/Pages/one_charter_page.dart';
import 'package:api_marvel/Widgets/banner_charter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:api_marvel/marvel_character.dart';
import 'package:api_marvel/Widgets/Item_card_charter.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late Future<List<MarvelCharacter>> characters;

  @override
  void initState() {
    super.initState();
    characters = fetchMarvelCharacters();
  }

  Future<List<MarvelCharacter>> fetchMarvelCharacters() async {
    try {
      const publicKey = 'ad6bdd113a25813549da8c25b33f1997'; // Tu clave pública
      const privateKey =
          'aa1ed69b8b152b4a208a17722aa2184abdfae3c9'; // Tu clave privada
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

        return charactersData
            .map<MarvelCharacter>(
                (characterData) => MarvelCharacter.fromJson(characterData))
            .toList();
      } else {
        throw Exception('Error al obtener los personajes de Marvel');
      }
    } catch (e) {
      // Manejar cualquier excepción que ocurra durante la solicitud HTTP.
      throw Exception('Error en la solicitud HTTP: $e');
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
            expandedHeight: 100.0,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: BanerCharter(),
            ),
          ),
          FutureBuilder<List<MarvelCharacter>>(
            future: characters,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('No se encontraron personajes.'),
                  ),
                );
              } else {
                final characterList = snapshot.data;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final character = characterList![index];
                      return ItemCardCharter(
                          title: removeParentheses(character.name),
                          image: character.image,
                          comicsCount: character.comicsCount.toString(),
                          seriesCount: character.seriesCount.toString(),
                          storiesCount: character.storiesCount.toString(),
                          eventsCount: character.eventsCount.toString(),
                          character: character,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OneCharterPage(character: character),
                                ));
                          });
                    },
                    childCount: characterList!.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
