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

class BasePage extends StatefulWidget {
  const BasePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late List<Widget> _pages;
  late Widget _stream;
  late Widget _subs;
  late Widget _settings;
  late Widget _currentPage;
  late int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _stream = const Stream();
    _subs = const Subs();
    _settings = const Settings();
    _pages = [_stream, _subs, _settings];
    _currentIndex = 0;
    _currentPage = _stream;
  }

  //BottomNavBar
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fork_right),
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
        selectedItemColor: globals.themeColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
