import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../models/wic_model.dart';
import 'dart:async';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState
    extends State<DashboardScreen> {
      final List<WicModel> wics =
    WicModel.generarWics();
    late Timer timer;
    @override
void initState() {

  super.initState();

  timer = Timer.periodic(
    const Duration(seconds: 3),

        (_) {

      setState(() {

        for (var wic in wics) {
          wic.actualizarTemperatura();
        }

      });
    },
  );
}@override
void dispose() {

  timer.cancel();

  super.dispose();
}

  int obtenerTotalProductos() {
    return productos.length;
  }

  int obtenerAlertas() {

    return productos.where((producto) {

      return producto.estado == 'RETIRAR';

    }).length;
  }

  int obtenerVencidos() {

    return productos.where((producto) {

      return producto.estado == 'VENCIDO';

    }).length;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F6FA),

      drawer: Drawer(

        child: ListView(
          children: [

            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF0057B8),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,

                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xFF0057B8),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Supervisor Makro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text(
                    'supervisorff@adminmakro.com',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                ],
              ),
            ),

            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
            ),

            const ListTile(
              leading: Icon(Icons.inventory),
              title: Text('Productos'),
            ),

            const ListTile(
              leading: Icon(Icons.warning),
              title: Text('Alertas'),
            ),

            const ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar Sesión'),
            ),

          ],
        ),
      ),

      appBar: AppBar(

        backgroundColor: const Color(0xFF0057B8),
        elevation: 0,

        title: Image.asset(
          'assets/Makro_Europe_logo.png',
          height: 40,
        ),

        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),

        ],
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Container(
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
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Text(
                            '¡Bienvenido, Supervisor!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            'Control y monitoreo\n'
                                'de productos congelados',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),

                        ],
                      ),
                    ),

                    Icon(
                      Icons.ac_unit,
                      size: 90,
                      color: Colors.blue[700],
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: [

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF0057B8),
                            Color(0xFF1E88E5),
                          ],
                        ),

                        borderRadius:
                        BorderRadius.circular(20),
                      ),

                      child: Column(
                        children: [

                          const Icon(
                            Icons.inventory_2,
                            color: Colors.white,
                            size: 45,
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            'Productos\nregistrados',
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            '${obtenerTotalProductos()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFE53935),
                            Color(0xFFFF5252),
                          ],
                        ),

                        borderRadius:
                        BorderRadius.circular(20),
                      ),

                      child: Column(
                        children: [

                          const Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.white,
                            size: 45,
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            'Alertas\nactivas',
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            '${obtenerAlertas()}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF00C853),
                      Color(0xFF00E676),
                    ],
                  ),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    Icon(
                      Icons.thermostat,
                      color: Colors.white,
                      size: 50,
                    ),

                    Column(
                      children: [

                        Text(
                          'Temperatura actual',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          '-18°C',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        Text(
                          'Temperatura estable',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                      ],
                    ),

                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 45,
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 20),

             const Text(
  'Monitoreo de WICs',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 20),

GridView.builder(

  shrinkWrap: true,
  physics:
  const NeverScrollableScrollPhysics(),

  itemCount: wics.length,

  gridDelegate:
  const SliverGridDelegateWithFixedCrossAxisCount(

    crossAxisCount: 2,
    crossAxisSpacing: 15,
    mainAxisSpacing: 15,
    childAspectRatio: 1.05,
  ),

  itemBuilder: (context, index) {

    final wic = wics[index];

    Color color;

    if (wic.estado == 'ESTABLE') {

      color = Colors.green;

    } else if (wic.estado == 'PRECAUCIÓN') {

      color = Colors.orange;

    } else {

      color = Colors.red;
    }

    return AnimatedContainer(

      duration:
      const Duration(milliseconds: 800),

      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color:
            Colors.black.withOpacity(0.05),

            blurRadius: 10,
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Text(
            wic.nombre,

            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          AnimatedSwitcher(

            duration:
            const Duration(milliseconds: 700),

            child: Icon(
              Icons.ac_unit,
              key: ValueKey(
                wic.temperatura,
              ),

              size: 28,
              color: color,
            ),
          ),

          const SizedBox(height: 5),

          AnimatedSwitcher(

            duration:
            const Duration(milliseconds: 700),

            child: Text(
              '${wic.temperatura.toStringAsFixed(1)}°C',

              key: ValueKey(
                wic.temperatura,
              ),

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Container(

            padding:
            const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),

            decoration: BoxDecoration(
              color: color,
              borderRadius:
              BorderRadius.circular(15),
            ),

            child: Text(
              wic.estado,

              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),

        ],
      ),
    );
  },
),

const SizedBox(height: 30),
              const Text(
                'Acciones rápidas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  _buildActionCard(
                    Icons.inventory_2,
                    'Ver\nProductos',
                    Colors.blue,
                  ),

                  _buildActionCard(
                    Icons.warning_amber_rounded,
                    'Ver\nAlertas',
                    Colors.orange,
                  ),

                  _buildActionCard(
                    Icons.add_circle,
                    'Registrar\nProducto',
                    Colors.green,
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(
      IconData icon,
      String title,
      Color color,
      ) {

    return Container(
      width: 100,
      padding: const EdgeInsets.all(15),

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

      child: Column(
        children: [

          Icon(
            icon,
            size: 35,
            color: color,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 16,
            ),
          ),

        ],
      ),
    );
  }
}