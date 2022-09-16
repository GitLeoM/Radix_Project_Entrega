import 'package:flutter/material.dart';
import 'package:radix_entrega_project/Screens/home_screen.dart';
import 'package:radix_entrega_project/Screens/profile_screen.dart';

import 'historic_screen.dart';

class TabsScreenHome extends StatefulWidget {
  @override
  State<TabsScreenHome> createState() => _TabsScreenHomeState();
}

class _TabsScreenHomeState extends State<TabsScreenHome> {
  int _selectScreenIndex = 1;

  final List<Widget> _listScreen = [
    HistoricScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listScreen[_selectScreenIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(35),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(132, 202, 157, 1),
          onTap: _selectScreen,
          selectedItemColor: Color.fromRGBO(108, 168, 129, 1),
          unselectedItemColor: Colors.white,
          currentIndex: _selectScreenIndex,
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(132, 202, 157, 1),
              icon: Icon(Icons.history),
              label: 'Histórico',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(132, 202, 157, 1),
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(132, 202, 157, 1),
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
