import 'package:flutter/material.dart';
import '../data/product_data.dart';

class AlertasScreen extends StatelessWidget {
  const AlertasScreen({super.key});

  Color obtenerColor(String estado) {

    if (estado == 'VENCIDO') {
      return Colors.red;
    }

    return Colors.orange;
  }

  IconData obtenerIcono(String estado) {

    if (estado == 'VENCIDO') {
      return Icons.cancel;
    }

    return Icons.warning_amber_rounded;
  }

  @override
  Widget build(BuildContext context) {

    final alertas = productos.where((producto) {

      return producto.estado == 'RETIRAR'
          || producto.estado == 'VENCIDO';

    }).toList();

    return Scaffold(

      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0057B8),

        title: const Text(
          'Alertas Automáticas',
        ),
      ),

      body: alertas.isEmpty

          ? const Center(
        child: Text(
          'No hay alertas activas',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      )

          : ListView.builder(

        padding: const EdgeInsets.all(15),

        itemCount: alertas.length,

        itemBuilder: (context, index) {

          final producto = alertas[index];

          return Container(

            margin: const EdgeInsets.only(bottom: 20),

            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(20),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                ClipRRect(
  borderRadius: BorderRadius.circular(15),

  child: Image.asset(
    producto.imagen,
    width: 90,
    height: 90,
    fit: BoxFit.cover,
  ),
),

                const SizedBox(width: 15),
                Expanded(

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(
                        producto.nombre,

                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
  'Código MK: ${producto.codigoMK}',
  style: const TextStyle(
    fontSize: 16,
    color: Colors.grey,
  ),
),

                      const SizedBox(height: 10),

                      Text(
                        'Lote: ${producto.lote}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Cantidad: ${producto.cantidad}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Vencimiento: '
                            '${producto.vencimiento.day}/'
                            '${producto.vencimiento.month}/'
                            '${producto.vencimiento.year}',

                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Retiro aproximado: '
                            '${producto.fechaRetiro.day}/'
                            '${producto.fechaRetiro.month}/'
                            '${producto.fechaRetiro.year}',

                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Container(

                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),

                        decoration: BoxDecoration(
                          color: obtenerColor(
                            producto.estado,
                          ),

                          borderRadius:
                          BorderRadius.circular(20),
                        ),

                        child: Text(

                          producto.estado == 'VENCIDO'
                              ? 'PRODUCTO VENCIDO'
                              : 'RETIRAR PRODUCTO',

                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}