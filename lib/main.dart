//NAVEGACION
// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Imágenes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height *
                0.6, //responsive, ocupa el 60% de la pantalla
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
                child: Column(
              children: const [
                FilaImagenes(tipoBoxFit: BoxFit.contain, tipoNombre: 'Contain'),
                FilaImagenes(tipoBoxFit: BoxFit.cover, tipoNombre: 'Cover'),
                FilaImagenes(tipoBoxFit: BoxFit.fill, tipoNombre: 'Fill'),
                FilaImagenes(
                    tipoBoxFit: BoxFit.fitHeight, tipoNombre: 'Fit height'),
                FilaImagenes(
                    tipoBoxFit: BoxFit.fitWidth, tipoNombre: 'Fit width'),
                FilaImagenes(tipoBoxFit: BoxFit.none, tipoNombre: 'None'),
                FilaImagenes(
                    tipoBoxFit: BoxFit.scaleDown, tipoNombre: 'Scale down'),
              ],
            )),
            padding: const EdgeInsets.all(10),
          ),
          Flexible(
            // responsive, ocupa el espacio restante
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    //tamaño cambia
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Image.asset('assets/images/dart_logo_1.png')),
                Container(
                    height: 50, //tamaño constante
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: const Image(
                        image: AssetImage('assets/images/dart_logo_2.png'))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilaImagenes extends StatelessWidget {
  const FilaImagenes(
      {Key? key, required this.tipoBoxFit, required this.tipoNombre})
      : super(key: key);
  final BoxFit tipoBoxFit;
  final String tipoNombre;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
              height: 100,
              width: 150,
              color: Colors.black,
              child: Image.network(
                  //forma 1 desde internet
                  'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png',
                  fit: tipoBoxFit)),
          Container(
              height: 150,
              width: 100,
              color: Colors.black,
              child: Image(
                  image: const NetworkImage(//forma 2 desde internet
                      'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png'),
                  fit: tipoBoxFit)),
        ]),
        SizedBox(child: Text(tipoNombre), height: 50)
      ],
    );
  }
}
