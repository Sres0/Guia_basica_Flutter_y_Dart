import 'package:flutter/material.dart';
import 'package:proyecto3_1/constants/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> _estadoIcono = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  final languageImages = [
    'http://assets.stickpng.com/images/5847f289cef1014c0b5e486b.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/1200px-PHP-logo.svg.png',
    'https://www.wired.com/images_blogs/business/2011/08/HTML5_Logo_512.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/CSS3_logo_and_wordmark.svg/726px-CSS3_logo_and_wordmark.svg.png',
    'https://ashalkey.github.io/assets/images/javascript.png',
    'https://www.avenga.com/wp-content/uploads/2020/11/C-Sharp.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1200px-Python-logo-notext.svg.png',
    'https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/swift/swift.png',
  ];

  void _presionarIcono(int i) =>
      setState(() => _estadoIcono[i] = !_estadoIcono[i]);

  @override
  Widget build(BuildContext context) {
    const title = 'Inicio';
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(15),
                        height: 140,
                        child: Image.network(languageImages[index],
                            fit: BoxFit.contain)),
                    Flexible(
                      child: IconButton(
                        onPressed: () => _presionarIcono(index),
                        icon: Icon(_estadoIcono[index]
                            ? Icons.favorite
                            : Icons.favorite_border),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kPrimaryColorLight,
              ),
            ),
            itemCount: 8,
          ),
        ),
      ),
    );
  }
}
