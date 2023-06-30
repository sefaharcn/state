import 'package:calculator/service_locator.dart';
import 'package:flutter/material.dart';

import 'counterState.dart';

class appBarIcon extends StatelessWidget {
  appBarIcon({super.key});
  final state1 = getIt.get<counterState>();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: state1.counter, //nereyi dinleyecek kodu burada
        builder: (context, listenMe, _) {
          return Icon(listenMe >= 0 ? Icons.mood : Icons.mood_bad);
        });
  }
}
