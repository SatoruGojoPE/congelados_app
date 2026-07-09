import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'productos_screen.dart';
import 'alertas_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  final List<Widget> screens = [
    const DashboardScreen(),
    const ProductosScreen(),
    const AlertasScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Productos',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Alertas',
          ),

        ],
      ),
    );
  }
}