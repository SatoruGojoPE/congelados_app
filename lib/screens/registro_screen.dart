import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../data/product_data.dart';
import '../data/catalogo_productos.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() =>
      _RegistroScreenState();
}

class _RegistroScreenState
    extends State<RegistroScreen> {

  final codigoController =
  TextEditingController();

  final nombreController =
  TextEditingController();

  final loteController =
  TextEditingController();

  final cantidadController =
  TextEditingController();

  final temperaturaController =
  TextEditingController();

  DateTime? produccion;
  DateTime? vencimiento;

  Future<void>
  seleccionarFechaProduccion() async {

    final fecha = await showDatePicker(
      context: context,

      firstDate: DateTime(2020),

      lastDate: DateTime(2035),

      initialDate: DateTime.now(),
    );

    if (fecha != null) {

      setState(() {
        produccion = fecha;
      });
    }
  }

  Future<void>
  seleccionarFechaVencimiento() async {

    final fecha = await showDatePicker(
      context: context,

      firstDate: DateTime(2020),

      lastDate: DateTime(2035),

      initialDate: DateTime.now(),
    );

    if (fecha != null) {

      setState(() {
        vencimiento = fecha;
      });
    }
  }

  void guardarProducto() {

    if (produccion == null ||
        vencimiento == null) {

      return;
    }

    final producto = ProductModel(

  codigoMK:
  codigoController.text,

  nombre:
  nombreController.text,

  imagen:
  'assets/productos/AroArveja1kg.png',

  lote:
  loteController.text,

  cantidad:
  int.parse(
    cantidadController.text,
  ),

  temperatura:
  double.parse(
    temperaturaController.text,
  ),

  produccion:
  produccion!,

  vencimiento:
  vencimiento!,
);

    productos.add(producto);

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(
        content: Text(
          'Producto registrado correctamente',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFFF5F6FA),

      appBar: AppBar(

        title: const Text(
          'Registrar Producto',
        ),

        backgroundColor:
        const Color(0xFF0057B8),
      ),

      body: SingleChildScrollView(

        padding:
        const EdgeInsets.all(20),

        child: Column(
          

          children: [
            if (imagenProducto != null)
  Column(
    children: [

      ClipRRect(
        borderRadius:
            BorderRadius.circular(15),

        child: Image.asset(
          imagenProducto!,
          height: 160,
          fit: BoxFit.contain,
        ),
      ),

      const SizedBox(height: 20),
    ],
  ),
            TextField(
              controller:
              codigoController,
              onChanged: (value) {
  buscarProducto();
},

              keyboardType:
              TextInputType.number,

              decoration:
              const InputDecoration(
                

                labelText:
                
                'Código MK',

                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
  controller: nombreController,

  readOnly: true,
              decoration:
              const InputDecoration(

                labelText:
                'Nombre del producto',

                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
              loteController,

              decoration:
              const InputDecoration(

                labelText:
                'Lote',

                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
              cantidadController,

              keyboardType:
              TextInputType.number,

              decoration:
              const InputDecoration(

                labelText:
                'Cantidad',

                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
              temperaturaController,

              keyboardType:
              TextInputType.number,

              decoration:
              const InputDecoration(

                labelText:
                'Temperatura',

                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ListTile(

              tileColor:
              Colors.white,

              shape:
              RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(15),
              ),

              title: Text(

                produccion == null

                    ? 'Seleccionar fecha de producción'

                    : 'Producción: '
                    '${produccion!.day}/'
                    '${produccion!.month}/'
                    '${produccion!.year}',
              ),

              trailing:
              const Icon(
                Icons.calendar_month,
              ),

              onTap:
              seleccionarFechaProduccion,
            ),

            const SizedBox(height: 20),

            ListTile(

              tileColor:
              Colors.white,

              shape:
              RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(15),
              ),

              title: Text(

                vencimiento == null

                    ? 'Seleccionar fecha de vencimiento'

                    : 'Vencimiento: '
                    '${vencimiento!.day}/'
                    '${vencimiento!.month}/'
                    '${vencimiento!.year}',
              ),

              trailing:
              const Icon(
                Icons.calendar_month,
              ),

              onTap:
              seleccionarFechaVencimiento,
            ),

            const SizedBox(height: 35),

            SizedBox(

              width: double.infinity,
              height: 60,

              child: ElevatedButton(

                style:
                ElevatedButton.styleFrom(

                  backgroundColor:
                  const Color(
                    0xFF0057B8,
                  ),

                  shape:
                  RoundedRectangleBorder(

                    borderRadius:
                    BorderRadius.circular(
                      18,
                    ),
                  ),
                ),

                onPressed:
                guardarProducto,

                child: const Text(

                  'Guardar Producto',

                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
 String? imagenProducto;
 void buscarProducto() {

  final encontrado = catalogoProductos.where(
    (p) => p.codigoMK == codigoController.text,
  );

  if (encontrado.isNotEmpty) {

    final producto = encontrado.first;

    setState(() {

      nombreController.text =
          producto.nombre;

      imagenProducto =
          producto.imagen;
    });

  } else {

    setState(() {

      nombreController.clear();

      imagenProducto = null;
    });
  }
}
}
