import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class Subs extends StatelessWidget {
  const Subs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubsPage();
  }
}

class SubsPage extends StatefulWidget {
  const SubsPage({Key? key}) : super(key: key);

  @override
  State<SubsPage> createState() => _SubsState();
}

class _SubsState extends State<SubsPage> {
  void _add() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(globals.subs,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
