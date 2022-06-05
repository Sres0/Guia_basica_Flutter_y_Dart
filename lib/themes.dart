//Themes

import 'package:flutter/material.dart';
import './constants/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData(),
      home: const MyHomePage(title: 'Temas'),
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
    final _theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Texto por defecto (body text 2)'),
                      Text('Headline 6', style: _theme.headline6 as TextStyle),
                      Text('Headline 5', style: _theme.headline5 as TextStyle),
                      Text('Headline 4', style: _theme.headline4 as TextStyle),
                      Text('Subtitle 1', style: _theme.subtitle1 as TextStyle),
                      Text('Subtitle 2', style: _theme.subtitle2 as TextStyle),
                      Text('Bodytext 1', style: _theme.bodyText1 as TextStyle),
                      Text('Bodytext 2', style: _theme.bodyText2 as TextStyle),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(color: kPrimaryColorDark),
                  flex: 1,
                )
              ],
            ),
          ),
        ));
  }
}
