//Miscellaneous

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = '';
  double _currentSliderValue = 1;

  String text = 'Sin sensación';
  Color color = Colors.green;
  IconData emotionIcon = Icons.favorite;

  List<IconData> icons = [
    Icons.delete_forever_outlined,
    Icons.delete_outline_outlined,
    Icons.bookmark_outline_sharp,
    Icons.check,
    Icons.check_circle_outline,
  ];

  List<String> lables = ['Terrible', 'Malo', 'Moderado', 'Bueno', 'Excelente'];

  int pain = 1;

  void changeTextAndColor(pain) {
    String sliderText = lables[0];
    Color sliderColor = Colors.red;
    IconData icon = icons[0];
    if (pain == 1) {
      sliderText = lables[0];
      icon = icons[0];
      sliderColor = Colors.red;
    } else if (pain <= 2) {
      sliderText = lables[1];
      icon = icons[1];
      sliderColor = Colors.deepOrange;
    } else if (pain <= 3) {
      sliderText = lables[2];
      icon = icons[2];
      sliderColor = Colors.purple;
    } else if (pain <= 4) {
      sliderText = lables[3];
      icon = icons[3];
      sliderColor = Colors.blue;
    } else if (pain <= 5) {
      sliderText = lables[4];
      icon = icons[4];
      sliderColor = Colors.green;
    }
    setState(() {
      text = sliderText;
      color = sliderColor;
      emotionIcon = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('Misceláneos'));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        //SLIDER
        Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            children: [
              Center(
                  child: Text(
                      'Slider: ${_currentSliderValue.toInt().toString()}',
                      softWrap: true,
                      overflow: TextOverflow.fade)),
              Column(
                children: [
                  Slider(
                    activeColor: color,
                    inactiveColor: Colors.grey,
                    value: _currentSliderValue,
                    min: 1,
                    max: 5,
                    divisions: 4,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                        changeTextAndColor(value);
                      });
                    },
                  ),
                  Row(children: [
                    Text(text, style: TextStyle(color: color)),
                    Icon(emotionIcon, color: color)
                  ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
