import 'package:flutter/material.dart';

class ItemCardSerieCharter extends StatelessWidget {
  final String title;
 

  const ItemCardSerieCharter({Key? key, required this.title, }) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 50.0, // Utiliza el valor de cardHeight para definir la altura
        width: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
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