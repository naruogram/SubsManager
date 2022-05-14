import 'package:flutter/material.dart';
import 'package:subsmanager/lists.dart';
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
  List<SubsList> subsList = [SubsList(name: "Apple One", fee: 1030.toDouble())];

  void _add() {
    setState(() {
      //UIページには関数は基本書かない。関数ページを別に作って書く(MVCやMVVMを意識すると良い)
      subsList.add(SubsList(name: "Apple One", fee: 1030.toDouble()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            //UIの使い方はかなりいいと思います！
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(globals.subs,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Expanded(
                //SliverWidgetsとかも使ってみるの検討するといいと思うけど、今回はこの使い方で良いと思う！
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return _subsItem(subsList[index].name,subsList[index].fee);
                  },
                  itemCount: subsList.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        tooltip: 'Add a Subscriptiom',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _subsItem(String name, double fee) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    height: 100,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        Text(
          //この書き方は良くないから変換してから feeと書けるように変数やHelperを使って解決すると可読性が上がります
          fee.toString(),
          style: const TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 104, 104, 104)),
        ),
      ],
    ),
  );
}
