import 'package:flutter/material.dart';

class ItemCardSerieCharter extends StatelessWidget {
  final String title;
  final String image;
 

  const ItemCardSerieCharter({Key? key, required this.title, required this.image, }) : super(key: key);
@override
Widget build(BuildContext context) {
  return Card(
    child: SizedBox(
      height: 100.0, // Define la altura total de la tarjeta
      width: 100.0, // Define el ancho de la tarjeta
      child: Stack(
        children: [
          Positioned.fill(
            top: 0.0, // Coloca la imagen en la parte superior de la tarjeta
            child: Image.network(
              image, // URL de la imagen
              fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la área
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0, // Altura de la mitad superior (imagen)
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 10.0, // Tamaño de fuente del título
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0, // Altura de la mitad inferior (espacio en blanco)
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}