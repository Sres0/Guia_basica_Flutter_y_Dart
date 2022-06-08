//Miscellaneous

import 'package:flutter/material.dart';
import 'package:proyecto3_1/constants/app_theme.dart';

class PaginaAnimo extends StatefulWidget {
  const PaginaAnimo({Key? key}) : super(key: key);
  @override
  State<PaginaAnimo> createState() => _PaginaAnimoState();
}

class _PaginaAnimoState extends State<PaginaAnimo> {
  String title = '';
  double _currentSliderValue = 1;
  int _posicionListaImagenes = 0;
  final _listaImagenes = [
    'https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/10/01/20/28/animal-967657_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/02/22/10/06/hedgehog-1215140_1280.jpg',
    'https://cdn.pixabay.com/photo/2020/02/05/15/19/meerkat-4821484_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/11/03/12/58/dalmatian-1020790_1280.jpg'
  ];

  String text = 'Terrible';
  Color color = Colors.red;
  IconData icon = Icons.delete_forever_outlined;

  List<IconData> icons = [
    Icons.mood_bad,
    Icons.face,
    Icons.mood_outlined,
  ];

  List<String> lables = ['Terrible', 'Moderado', 'Excelente'];

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
      _sliderColor = Colors.purple;
    } else if (sliderVal <= 3) {
      _sliderText = lables[2];
      _icon = icons[2];
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
    final appBar = AppBar(title: const Text('Ánimo'));
    return Scaffold(
      backgroundColor: kSecondaryColorDark,
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.95,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    children: [
                      Center(
                          child: Text('Ánimo antes y después de las imágenes',
                              style: TextStyle(color: kPrimaryColorLight))),
                      Slider(
                        activeColor: color,
                        inactiveColor: kPrimaryColorLight,
                        value: _currentSliderValue,
                        min: 1,
                        max: 3,
                        divisions: 2,
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
            InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  setState(() {
                    _posicionListaImagenes = _posicionListaImagenes > 3
                        ? 0
                        : _posicionListaImagenes += 1;
                  });
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.black,
                      child: Image(
                          image: NetworkImage(
                              _listaImagenes[_posicionListaImagenes]),
                          fit: BoxFit.fitWidth)),
                )),
          ]),
        ),
      ),
    );
  }
}
