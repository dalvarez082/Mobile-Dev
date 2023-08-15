
import 'dart:io';

void main() {
  print("Bienvenido al convertidor de temperaturas!");
  
  while (true) {
    print("\nElija una opción:");
    print("1. Convertir de Celsius a Fahrenheit");
    print("2. Convertir de Fahrenheit a Celsius");
    print("3. Salir");
    
    String option = stdin.readLineSync()!;
    
    if (option == "1") {
      Celsius();
    } else if (option == "2") {
      Fahrenheit();
    } else if (option == "3") {
      print("Terminaste el convertidor");
      break;
    } else {
      print("Opción no válida. Por favor, elija una opción válida.");
    }
  }
}

void Celsius() {
  print("\nIngrese la temperatura en grados Celsius:");
  double celsius = double.parse(stdin.readLineSync()!);
  double fahrenheit = (celsius * 9/5) + 32;
  print("$celsius grados Celsius son equivalentes a $fahrenheit grados Fahrenheit.");
}

void Fahrenheit() {
  print("\nIngrese la temperatura en grados Fahrenheit:");
  double fahrenheit = double.parse(stdin.readLineSync()!);
  double celsius = (fahrenheit - 32) * 5/9;
  print("$fahrenheit grados Fahrenheit son equivalentes a $celsius grados Celsius.");
}

