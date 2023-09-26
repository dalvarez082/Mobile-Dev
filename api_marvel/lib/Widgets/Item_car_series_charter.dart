import 'package:flutter/material.dart';

class ItemCardSerieCharter extends StatelessWidget {
  final String title;
  final String image;

  const ItemCardSerieCharter({Key? key, required this.title, required this.image}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 50.0, // Utiliza el valor de cardHeight para definir la altura
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              image,
              fit: BoxFit.cover,
              width: 20, // Ajusta el ancho de la imagen según tus necesidades
              height: 30, // Ajusta el alto de la imagen según tus necesidades
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // Espacio alrededor del título
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 10.0, // Ajusta el tamaño de fuente según tus necesidades
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}