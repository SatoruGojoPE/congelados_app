import 'package:flutter/material.dart';

import '../data/product_data.dart';
import 'registro_screen.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() =>
      _ProductosScreenState();
}

class _ProductosScreenState
    extends State<ProductosScreen> {

  final TextEditingController
  buscarController =
  TextEditingController();

  String busqueda = '';

  Color obtenerColorEstado(String estado) {

    if (estado == 'VENCIDO') {
      return Colors.red;
    }

    if (estado == 'RETIRAR') {
      return Colors.orange;
    }

    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {

    final productosFiltrados =
    productos.where((producto) {

      final texto =
      busqueda.toLowerCase();

      return producto.nombre
          .toLowerCase()
          .contains(texto)

          ||

          producto.lote
              .toLowerCase()
              .contains(texto)

          ||

          producto.codigoMK
              .toLowerCase()
              .contains(texto);

    }).toList();

    return Scaffold(

      backgroundColor:
      const Color(0xFFF5F6FA),

      appBar: AppBar(
        backgroundColor:
        const Color(0xFF0057B8),

        title: const Text(
          'Productos',
        ),
      ),

      floatingActionButton:
      FloatingActionButton(

        backgroundColor:
        const Color(0xFF0057B8),

        child: const Icon(Icons.add),

        onPressed: () async {

          await Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) =>
              const RegistroScreen(),
            ),
          );

          setState(() {});
        },
      ),

      body: Column(

        children: [

          Padding(
            padding:
            const EdgeInsets.all(15),

            child: TextField(

              controller:
              buscarController,

              onChanged: (value) {

                setState(() {
                  busqueda = value;
                });
              },

              decoration: InputDecoration(

                hintText:
                'Buscar por MK, lote o nombre',

                prefixIcon:
                const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border:
                OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(20),

                  borderSide:
                  BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(

            child:
            productosFiltrados.isEmpty

                ? const Center(
              child: Text(
                'No se encontraron productos',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )

                : ListView.builder(

              padding:
              const EdgeInsets.all(15),

              itemCount:
              productosFiltrados.length,

              itemBuilder:
                  (context, index) {

                final producto =
                productosFiltrados[index];

                return Container(

                  margin:
                  const EdgeInsets.only(
                    bottom: 20,
                  ),

                  padding:
                  const EdgeInsets.all(20),

                  decoration:
                  BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(
                          0.05,
                        ),

                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Row(

  crossAxisAlignment:
      CrossAxisAlignment.start,

  children: [

    ClipRRect(

      borderRadius:
          BorderRadius.circular(12),

      child: Image.asset(

        producto.imagen,

        width: 90,
        height: 90,

        fit: BoxFit.cover,

        errorBuilder:
            (context, error, stackTrace) {

          return Container(

            width: 90,
            height: 90,

            color: Colors.grey[300],

            child: const Icon(
              Icons.image,
              size: 40,
            ),
          );
        },
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
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Código MK: ${producto.codigoMK}',
          ),

          const SizedBox(height: 4),

          Text(
            'Lote: ${producto.lote}',
          ),
        ],
      ),
    ),

    Container(

      padding:
          const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(

        color:
            obtenerColorEstado(
          producto.estado,
        ),

        borderRadius:
            BorderRadius.circular(
          20,
        ),
      ),

      child: Text(

        producto.estado,

        style: const TextStyle(
          color: Colors.white,
          fontWeight:
              FontWeight.bold,
        ),
      ),
    ),
  ],
),

                      const SizedBox(
                        height: 15,
                      ),

                      

                      

                      Text(
                        'Cantidad: '
                            '${producto.cantidad}',
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      Text(
                        'Temperatura: '
                            '${producto.temperatura}°C',
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      Row(

                        mainAxisAlignment:
                        MainAxisAlignment.end,

                        children: [

                          ElevatedButton.icon(

                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              Colors.red,
                            ),

                            onPressed: () {

                              setState(() {

                                productos.remove(
                                  producto,
                                );
                              });
                            },

                            icon: const Icon(
                              Icons.delete,
                              color:
                              Colors.white,
                            ),

                            label: const Text(
                              'Eliminar',

                              style:
                              TextStyle(
                                color: Colors
                                    .white,
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}