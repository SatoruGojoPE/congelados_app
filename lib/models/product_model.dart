class ProductModel {

  final String nombre;
  final String codigoMK;
  final String imagen;

  final String lote;

  final DateTime produccion;
  final DateTime vencimiento;

  final int cantidad;
  final double temperatura;

  ProductModel({

    required this.nombre,
    required this.codigoMK,
    required this.imagen,

    required this.lote,

    required this.produccion,
    required this.vencimiento,

    required this.cantidad,
    required this.temperatura,
  });

  Duration get duracion {
    return vencimiento.difference(
      produccion,
    );
  }

  bool get esMayorAUnAnio {
    return duracion.inDays > 365;
  }

  DateTime get fechaRetiro {

    if (esMayorAUnAnio) {

      return vencimiento.subtract(
        const Duration(days: 10),
      );
    }

    return vencimiento.subtract(
      const Duration(days: 7),
    );
  }

  String get estado {

    final hoy = DateTime.now();

    if (hoy.isAfter(vencimiento)) {
      return 'VENCIDO';
    }

    if (hoy.isAfter(fechaRetiro)) {
      return 'RETIRAR';
    }

    return 'ESTABLE';
  }
}