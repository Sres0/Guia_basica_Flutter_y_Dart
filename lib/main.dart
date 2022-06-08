//APP INTEGRADORA

import 'package:flutter/material.dart';
import 'package:proyecto3_1/paginas/pagina_animo.dart';
import 'package:proyecto3_1/paginas/pagina_notas.dart';
import 'paginas/pagina_habitos.dart';
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
    const PaginaHabitos(),
    const PaginaNotas(),
    const PaginaAnimo()
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
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline), label: 'Hábitos'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Notas'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Ánimo')
        ],
      ),
    );
  }
}
