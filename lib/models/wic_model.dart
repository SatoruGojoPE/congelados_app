import 'dart:math';

class WicModel {

  final String nombre;
  double temperatura;

  WicModel({
    required this.nombre,
    required this.temperatura,
  });

  String get estado {

    if (temperatura >= -23 &&
        temperatura <= -18) {

      return 'ESTABLE';
    }

    if ((temperatura >= -17 &&
            temperatura <= -14) ||

        (temperatura >= -26 &&
            temperatura <= -24)) {

      return 'PRECAUCIÓN';
    }

    return 'CRÍTICO';
  }

  static final Random random = Random();

  static List<WicModel> generarWics() {

    return List.generate(8, (index) {

      double temperatura =
          -18 - random.nextInt(6).toDouble();

      return WicModel(
        nombre: 'WIC ${index + 1}',
        temperatura: temperatura,
      );
    });
  }

  void actualizarTemperatura() {

    int probabilidad =
    random.nextInt(100);

    if (probabilidad < 80) {

      temperatura +=
      random.nextBool()
          ? 1
          : -1;

      temperatura =
          temperatura.clamp(-23, -18);

    } else if (probabilidad < 95) {

      temperatura +=
      random.nextBool()
          ? 1
          : -1;

      temperatura =
          temperatura.clamp(-26, -14);

    } else {

      temperatura +=
      random.nextBool()
          ? 2
          : -2;
    }
  }
}