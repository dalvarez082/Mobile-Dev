import 'package:flutter/material.dart';

class BanerCharter extends StatelessWidget{
  const BanerCharter({super.key});


 @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF11E22), // Color de fondo rojo
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0), // Bordes inferiores redondeados
          bottomRight: Radius.circular(30.0),
        ),
      ),
      padding: const EdgeInsets.all(16.0), // Espaciado interior según tus necesidades
      child: Center(
        child: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Marvel-Comics-Logo.svg/1200px-Marvel-Comics-Logo.svg.png", // Ruta a tu imagen
          width: 200.0, // Ancho de la imagen
          height: 200.0, // Altura de la imagen
        ),
      ),
    ); 

  }



}