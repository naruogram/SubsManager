import 'package:flutter/material.dart';
import 'package:subsmanager/pages/settings.dart';
import 'package:subsmanager/pages/stream.dart';
import 'package:subsmanager/pages/subs.dart';
import 'globals.dart' as globals;

//Page Name

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: globals.title,
      theme: ThemeData(
        primarySwatch: globals.customSwatch,
      ),
      home: const BasePage(title: globals.stream),
    );
  }
}
//StatelessとStatefulの違いも理解できると良い(うまく使えています)
class BasePage extends StatefulWidget {
  const BasePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  void initState() {
    //initStateは最初に処理が走るので、データをUIに反映させるために
    //Firebaseあるいはローカルに保存するようなもの取得して、UIに反映させるように使う(参考程度)
    super.initState();
  }

  int _currentIndex = 0;
//_pageListsとpageListsの違いはグローバルに定義できるかどうか、つまり _ を最初につけるかどうかで変わる(private)
  static List<Widget> pageLists = const [
    Stream(),
    Subs(),
    Settings(),
  ];

  //BottomNavBar このような関数はUIページに書いても良いが複数回使うことがある関数は、関数ページに書く
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageLists[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Stream',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _currentIndex,
        //globalに定義しているテーマを使うの良い(使い方うまい)
        selectedItemColor: globals.themeColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
