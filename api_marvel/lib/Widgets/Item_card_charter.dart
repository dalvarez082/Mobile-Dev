// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ItemCardCharter extends StatelessWidget {
  final String title;
  final String image;

  const ItemCardCharter({super.key, required this.title, required this.image});

@override
Widget build(BuildContext context) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.network(
              image,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 8.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Alinea los textos horizontalmente
                  children: [
                    Text(
                      "Comics",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      "Series",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      "Stories",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      "Events",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}






}