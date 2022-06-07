//APP INTEGRADORA

import 'package:flutter/material.dart';
import 'paginas/home_screen.dart';
import 'paginas/favorite_page.dart';
import 'paginas/profile_page.dart';
import './constants/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeData(),
        home: const MyHomePage(title: 'Barra de navegación'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const FavoritePage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColorLight,
        selectedItemColor: kPrimaryColorDark,
        currentIndex: currentIndex,
        iconSize: 25,
        showUnselectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
