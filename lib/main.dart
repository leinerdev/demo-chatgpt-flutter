import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'screens/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MyPlanPage(),
    const MyProfilePage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fit Genius',
        initialRoute: 'home',
        home: Scaffold(
          body: _pages[_currentIndex],
          bottomNavigationBar: Container(
            color: Colors.black,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: GNav(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor: Colors.grey.shade900,
                  padding: const EdgeInsets.all(16),
                  gap: 8,
                  onTabChange: (index) {
                    _onItemTapped(index);
                  },
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Inicio',
                    ),
                    GButton(
                      icon: Icons.flash_on,
                      text: 'Mi plan',
                    ),
                    GButton(
                      icon: Icons.person_outline_outlined,
                      text: 'Mi perfil',
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Ajustes',
                    ),
                  ]),
            ),
          ),
        ));
  }
}
