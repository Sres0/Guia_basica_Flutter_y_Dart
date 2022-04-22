import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Botones'),
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
  bool _estadoElevado = false;
  bool _estadoIcono = true;
  int _elevado = 0;
  int _icono = 0;
  int _delineado = 0;
  int _texto = 0;
  int _flotante = 0;

  void _presionarElevado() {
    setState(() {
      _estadoElevado = !_estadoElevado;
      _elevado++;
    });
  }

  void _presionarIcono() {
    setState(() {
      _estadoIcono = !_estadoIcono;
      _icono++;
    });
  }

  void _incrementarDelineado() {
    setState(() => _delineado++);
  }

  void _incrementarTexto() {
    setState(() => _texto++);
  }

  void _incrementarFlotante() {
    setState(() => _flotante++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _presionarElevado,
                  child: Icon(_estadoElevado ? Icons.arrow_right : Icons.pause),
                ),
                IconButton(
                  onPressed: _presionarIcono,
                  icon: Icon(
                      _estadoIcono ? Icons.favorite_border : Icons.favorite),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: _incrementarDelineado,
                  child: const Text('Botón delineado'),
                ),
                TextButton(
                  onPressed: _incrementarTexto,
                  child: const Text('Botón de texto'),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text('Botón de elevado: $_elevado'),
            Text('Botón de icono: $_icono'),
            Text('Botón de delineado: $_delineado'),
            Text('Botón de texto: $_texto'),
            Text('Botón de flotante: $_flotante'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementarFlotante,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
