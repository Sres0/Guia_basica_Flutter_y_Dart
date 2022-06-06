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
  bool _currentSwitchState = false;
  Color containerColor = Colors.white;
  int gestureDetectorValue = 0;
  int inkwellValue = 0;

  String text = 'Terrible';
  Color color = Colors.red;
  IconData icon = Icons.delete_forever_outlined;

  List<IconData> icons = [
    Icons.delete_forever_outlined,
    Icons.delete_outline_outlined,
    Icons.bookmark_outline_sharp,
    Icons.check,
    Icons.check_circle_outline,
  ];

  List<String> lables = ['Terrible', 'Malo', 'Moderado', 'Bueno', 'Excelente'];

  int sliderVal = 1;

  void changeTextAndColor(sliderVal) {
    String _sliderText = lables[0];
    Color _sliderColor = Colors.red;
    IconData _icon = icons[0];
    if (sliderVal == 1) {
      _sliderText = lables[0];
      _icon = icons[0];
      _sliderColor = Colors.red;
    } else if (sliderVal <= 2) {
      _sliderText = lables[1];
      _icon = icons[1];
      _sliderColor = Colors.deepOrange;
    } else if (sliderVal <= 3) {
      _sliderText = lables[2];
      _icon = icons[2];
      _sliderColor = Colors.purple;
    } else if (sliderVal <= 4) {
      _sliderText = lables[3];
      _icon = icons[3];
      _sliderColor = Colors.blue;
    } else if (sliderVal <= 5) {
      _sliderText = lables[4];
      _icon = icons[4];
      _sliderColor = Colors.green;
    }
    setState(() {
      text = _sliderText;
      color = _sliderColor;
      icon = _icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('Misceláneos'));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.95,
        child: SingleChildScrollView(
          child: Column(children: [
            //SLIDER
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    children: [
                      Center(
                          child: Text(
                              'Slider: ${_currentSliderValue.toInt().toString()}',
                              softWrap: true,
                              overflow: TextOverflow.fade)),
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
                        Icon(icon, color: color)
                      ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //SWITCH
            Container(
                padding: const EdgeInsets.all(10),
                color: _currentSwitchState ? Colors.black54 : Colors.white,
                height: 100,
                child: Center(
                    child: Switch(
                  activeColor: Colors.white,
                  value: _currentSwitchState,
                  onChanged: (value) => setState(() {
                    _currentSwitchState = value;
                  }),
                ))),
            const SizedBox(height: 10),
            //Gesture detector e InkWell
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              GestureDetector(
                  onTap: () => setState(() => gestureDetectorValue += 1),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 80,
                      child: Center(
                        child: Text(
                          'Gesture detector: $gestureDetectorValue',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ))),
              InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => setState(() => inkwellValue += 1),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black54),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 80,
                      child: Center(
                        child: Text(
                          'Inkwell: $inkwellValue',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ))),
            ]),
            const SizedBox(height: 10),
            const ExpansionTile(
              collapsedBackgroundColor: Colors.blue,
              textColor: Colors.black,
              backgroundColor: Colors.grey,
              collapsedTextColor: Colors.white,
              childrenPadding: EdgeInsets.all(10),
              title: Text('Expansion tile'),
              children: [
                Text(
                    'El expansion tile sirve para mostrar o esconder los Children del Widget en pantalla.'),
                ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    title: Text('Más información'),
                    children: [
                      Text(
                          'Puedes poner tantos Widgets como quieras, incluso más Expansion tiles.')
                    ])
              ],
            )
          ]),
        ),
      ),
    );
  }
}
