import 'package:flutter/material.dart';
import 'package:proyecto3_1/constants/app_theme.dart';

class PaginaHabitos extends StatefulWidget {
  const PaginaHabitos({Key? key}) : super(key: key);
  @override
  State<PaginaHabitos> createState() => _PaginaHabitosState();
}

class _PaginaHabitosState extends State<PaginaHabitos> {
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

  final List<Color> _colorIndividual = [
    kPrimaryColorLight,
    kPrimaryColorLight,
    kPrimaryColorLight,
    kPrimaryColorLight,
    kPrimaryColorLight,
    kPrimaryColorLight,
    kPrimaryColorLight,
    kPrimaryColorLight
  ];

  final _habitInfo = [
    'https://cdn.pixabay.com/photo/2017/04/03/10/42/woman-2197947_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/06/22/22/16/thirst-1474240_1280.jpg',
    'https://cdn.pixabay.com/photo/2019/11/11/12/12/woman-4618189_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/10/09/19/29/eat-2834549_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/08/02/00/49/people-2569234_1280.jpg',
    'https://cdn.pixabay.com/photo/2020/03/09/18/02/hand-4916619_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/12/28/11/32/namaste-1935938_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/11/29/07/16/beach-1868047_1280.jpg',
  ];

  void _presionarIcono(int i) =>
      setState(() => _estadoIcono[i] = !_estadoIcono[i]);

  _presionarGrid(int i) => setState(() {
        _colorIndividual[i] = (_colorIndividual[i] == kPrimaryColorLight)
            ? Colors.green
            : (_colorIndividual[i] == Colors.green
                ? Colors.red
                : kPrimaryColorLight);
      });

  @override
  Widget build(BuildContext context) {
    const title = 'Hábitos';
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
            itemBuilder: (context, index) => InkWell(
              onTap: (() => _presionarGrid(index)),
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          child: Image.network(_habitInfo[index],
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          onPressed: () => _presionarIcono(index),
                          icon: Icon(_estadoIcono[index]
                              ? Icons.check_box_rounded
                              : Icons.check_box_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _colorIndividual[index],
                ),
              ),
            ),
            itemCount: 8,
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:proyecto3_1/constants/app_theme.dart';

// class PaginaHabitos extends StatefulWidget {
//   const PaginaHabitos({Key? key}) : super(key: key);
//   @override
//   State<PaginaHabitos> createState() => _PaginaHabitosState();
// }

// class _PaginaHabitosState extends State<PaginaHabitos> {
//   final List<bool> _estadoIcono = [
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false
//   ];

//   final List<Color> _colorIndividual = [
//     kPrimaryColorLight,
//     kPrimaryColorLight,
//     kPrimaryColorLight,
//     kPrimaryColorLight,
//     kPrimaryColorLight,
//     kPrimaryColorLight,
//     kPrimaryColorLight,
//     kPrimaryColorLight
//   ];

//   final _habitInfo = [
//     'https://cdn.pixabay.com/photo/2017/04/03/10/42/woman-2197947_1280.jpg',
//     'https://cdn.pixabay.com/photo/2016/06/22/22/16/thirst-1474240_1280.jpg',
//     'https://cdn.pixabay.com/photo/2019/11/11/12/12/woman-4618189_1280.jpg',
//     'https://cdn.pixabay.com/photo/2017/10/09/19/29/eat-2834549_1280.jpg',
//     'https://cdn.pixabay.com/photo/2017/08/02/00/49/people-2569234_1280.jpg',
//     'https://cdn.pixabay.com/photo/2020/03/09/18/02/hand-4916619_1280.jpg',
//     'https://cdn.pixabay.com/photo/2016/12/28/11/32/namaste-1935938_1280.jpg',
//     'https://cdn.pixabay.com/photo/2016/11/29/07/16/beach-1868047_1280.jpg',
//   ];

//   void _presionarIcono(int i) =>
//       setState(() => _estadoIcono[i] = !_estadoIcono[i]);

//   _presionarGrid(int i) => setState(() {
//         print(_colorIndividual[i]);
//         _colorIndividual[i] = (_colorIndividual[i] == kPrimaryColorLight)
//             ? Colors.green
//             : (_colorIndividual[i] == Colors.green
//                 ? Colors.red
//                 : kPrimaryColorLight);
//       });

//   @override
//   Widget build(BuildContext context) {
//     const title = 'Inicio';
//     return Scaffold(
//       appBar: AppBar(title: const Text(title)),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 300,
//               mainAxisSpacing: 10,
//               crossAxisSpacing: 10,
//             ),
//             itemBuilder: (context, index) => GestureDetector(
//               onTap: (() => _presionarGrid(index)),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: kPrimaryColorLight,
//                     borderRadius: const BorderRadius.all(Radius.circular(30))),
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                           padding: const EdgeInsets.all(15),
//                           height: 140,
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(30),
//                                 topRight: Radius.circular(30)),
//                             child: Image.network(_habitInfo[index],
//                                 fit: BoxFit.contain),
//                           )),
//                       Flexible(
//                         child: Row(
//                           children: [
//                             const Text('data'),
//                             IconButton(
//                               onPressed: () => _presionarIcono(index),
//                               icon: Icon(_estadoIcono[index]
//                                   ? Icons.check_box
//                                   : Icons.check_box_outlined),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             itemCount: 8,
//           ),
//         ),
//       ),
//     );
//   }
// }
