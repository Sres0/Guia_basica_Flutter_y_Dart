import 'dart:ui';

import 'package:flutter/material.dart';
import '../constants/app_theme.dart';

class PaginaNotas extends StatefulWidget {
  const PaginaNotas({Key? key}) : super(key: key);
  @override
  State<PaginaNotas> createState() => _PaginaNotasState();
}

class _PaginaNotasState extends State<PaginaNotas> {
  final TextEditingController _textFieldController = TextEditingController();
  bool _isDark = true;
  Color _bgColor = kSecondaryColorLight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _bgColor,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    selectionHeightStyle: BoxHeightStyle.max,
                    style: TextStyle(
                        color:
                            _isDark ? kPrimaryColorDark : kPrimaryColorLight),
                    controller: _textFieldController,
                    minLines: 1,
                    maxLines: 40,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      hintStyle: TextStyle(
                          color:
                              _isDark ? kPrimaryColorDark : kPrimaryColorLight),
                      hintText:
                          'Escribe notas aleatorias que se perderán en el multiverso digital',
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: kPrimaryColorLight),
                  onPressed: () => FocusScope.of(context).unfocus(),
                  child: const Text('Listo!'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Switch(
                          activeColor: kPrimaryColorDark,
                          inactiveThumbColor: kPrimaryColorLight,
                          inactiveTrackColor: kPrimaryColorLight,
                          value: _isDark,
                          onChanged: (value) => setState(() {
                                _isDark = value;
                              })),
                      colorearFondo(Colors.blue),
                      colorearFondo(Colors.orange),
                      colorearFondo(Colors.green),
                      colorearFondo(kSecondaryColorDark),
                      colorearFondo(kPrimaryColorLight),
                    ],
                  ),
                ),
              ]),
            )));
  }

  SizedBox colorearFondo(Color color) {
    return SizedBox(
        height: 30,
        width: 60,
        child: ElevatedButton(
            onPressed: () => setState(() => (_bgColor = color)),
            child: const Text(' '),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              primary: color,
              onPrimary: kPrimaryColorLight,
            )));
  }
}
