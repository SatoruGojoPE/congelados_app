import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0057B8),

        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(

            children: [

              const SizedBox(height: 20),

              const CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFF0057B8),

                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Supervisor Makro',

                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'supervisorff@adminmakro.com',

                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              _buildInfoCard(
                Icons.warehouse,
                'WICs monitoreados',
                '8',
                Colors.blue,
              ),

              const SizedBox(height: 15),

              _buildInfoCard(
                Icons.inventory_2,
                'Productos registrados',
                '120',
                Colors.green,
              ),

              const SizedBox(height: 15),

              _buildInfoCard(
                Icons.warning,
                'Alertas atendidas',
                '18',
                Colors.orange,
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,

                height: 55,

                child: ElevatedButton.icon(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: () {

                    Navigator.pop(context);
                  },

                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),

                  label: const Text(
                    'Cerrar Sesión',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      IconData icon,
      String title,
      String value,
      Color color,
      ) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),

      child: Row(

        children: [

          CircleAvatar(
            radius: 28,
            backgroundColor:
            color.withOpacity(0.15),

            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  value,

                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}