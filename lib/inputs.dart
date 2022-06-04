//INPUTS

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
  final TextEditingController _formFieldController = TextEditingController();
  final TextEditingController _textFieldController = TextEditingController();

  Widget _formFieldFunction(String text) {
    return (text.isEmpty)
        ? const Text('Acá aparecerá tu mensaje')
        : Row(
            children: [
              Flexible(
                child: Text(text),
              ),
            ],
          );
  }
  // setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _formFieldFunction(_formFieldController.value.text),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) =>
                        setState(() => {_formFieldFunction(value)}),
                    controller: _formFieldController,
                    minLines: 1,
                    maxLines: 5,
                    maxLength: 25,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje en el Text Form Field',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: (_textFieldController.value.text.isEmpty)
                      ? const Text('Acá aparecerá tu mensaje')
                      : Row(
                          children: [
                            Flexible(
                              child: Text(_textFieldController.value.text),
                            ),
                          ],
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _textFieldController,
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje en el Text Field',
                      // border: OutlineInputBorder(
                      // borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => FocusScope.of(context).unfocus(),
                  // onPressed: () => {setState(() => {})},
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
