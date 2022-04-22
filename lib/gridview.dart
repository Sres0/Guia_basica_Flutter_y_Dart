import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Test'),
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
  final screens = const [];

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.favorite,
      Icons.home,
      Icons.settings,
      Icons.play_arrow,
      Icons.alarm,
      Icons.music_note,
      Icons.local_activity,
      Icons.gamepad_sharp,
      Icons.key,
      Icons.wallet_travel,
      Icons.language,
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Grid')),
      body: Center(
        //GRIDVIEW
        // child: GridView(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2),
        //   // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //   //     maxCrossAxisExtent: 300),
        //   children: [
        //     Card(
        //       child: const Icon(Icons.home, size: 40, color: Colors.white),
        //       color: Colors.blue,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(30),
        //       ),
        //     ),
        //     Card(
        //       child: const Icon(Icons.settings, size: 40, color: Colors.white),
        //       color: Colors.grey,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(30),
        //       ),
        //     ),
        //     Card(
        //       child: const Icon(Icons.monetization_on,
        //           size: 40, color: Colors.white),
        //       color: Colors.green,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(30),
        //       ),
        //     ),
        //   ],
        // ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      icons[index],
                      color: Colors.white,
                      size: 40,
                    ),
                    Text(
                      index.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.blue, Colors.green],
                  )),
            ),
            itemCount: 9,
          ),
        ),
      ),
    );
  }
}
