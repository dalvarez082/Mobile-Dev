import 'dart:io';

enum Sexo { Hombre, Mujer }
enum EstadoCivil { Soltero, Casado, Viudo }

class Paciente {
  Sexo sexo;
  EstadoCivil estadoCivil;
  int edad;

  Paciente(this.sexo, this.estadoCivil, this.edad);
}

void main() {
  List<Paciente> pacientes = [];

  int totalHombres = 0;
  int hombresSolteros = 0;
  int totalMujeresSolteras = 0;
  int totalSolteros = 0;
  int totalHombresCasados = 0;
  int sumaEdadHombresCasados = 0;

  print("Ingrese el número de pacientes:");
  int numPacientes = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < numPacientes; i++) {
    print("Paciente ${i + 1}:");
    
    Sexo sexo;
    while (true) {
      print("Ingrese el sexo (1. Hombre, 2. Mujer):");
      int sexoInput = int.parse(stdin.readLineSync()!);
      if (sexoInput == 1) {
        sexo = Sexo.Hombre;
        break;
      } else if (sexoInput == 2) {
        sexo = Sexo.Mujer;
        break;
      } else {
        print("Opción inválida. Ingrese 1 para Hombre o 2 para Mujer.");
      }
    }

    EstadoCivil estadoCivil;
    while (true) {
      print("Ingrese el estado civil (1. Soltero, 2. Casado, 3. Viudo):");
      int estadoCivilInput = int.parse(stdin.readLineSync()!);
      if (estadoCivilInput >= 1 && estadoCivilInput <= 3) {
        estadoCivil = EstadoCivil.values[estadoCivilInput - 1];
        break;
      } else {
        print("Opción inválida. Ingrese un número entre 1 y 3.");
      }
    }

    print("Ingrese la edad:");
    int edad = int.parse(stdin.readLineSync()!);

    Paciente paciente = Paciente(sexo, estadoCivil, edad);
    pacientes.add(paciente);

    if (sexo == Sexo.Hombre) {
      totalHombres++;
      if (estadoCivil == EstadoCivil.Soltero) {
        hombresSolteros++;
      } else if (estadoCivil == EstadoCivil.Casado) {
        totalHombresCasados++;
        sumaEdadHombresCasados += edad;
      }
    } else if (sexo == Sexo.Mujer && estadoCivil == EstadoCivil.Soltero) {
      totalMujeresSolteras++;
    }

    if (estadoCivil == EstadoCivil.Soltero) {
      totalSolteros++;
    }
  }

  double porcentajeHombresSolteros =
      (hombresSolteros / totalHombres) * 100.0;
  double porcentajeMujeresSolteras =
      (totalMujeresSolteras / totalSolteros) * 100.0;
  double edadPromedioHombresCasados = totalHombresCasados > 0
      ? sumaEdadHombresCasados / totalHombresCasados
      : 0.0;

  print("Porcentaje de hombres solteros: $porcentajeHombresSolteros%");
  print("Edad promedio de hombres casados: $edadPromedioHombresCasados años");
  print("Porcentaje de mujeres solteras: $porcentajeMujeresSolteras%");
}
