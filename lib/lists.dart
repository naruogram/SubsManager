import 'dart:ffi';
import 'package:flutter/widgets.dart';

//後々Freezedを使って、クラス定義してみると良い(オブジェクト指向を理解していると感じられました)
class SubsList {
  String name;
  double fee;
  // String url;
  // String period;
  // DateTime date;

  SubsList({
    required this.name,
    required this.fee,
    // required this.url,
    // required this.period,
    // required this.date,
  });
}
