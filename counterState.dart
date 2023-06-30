import 'package:flutter/material.dart';

class counterState {
  // dinlenecek değişken
  ValueNotifier<int> counter = ValueNotifier<int>(0);
  // ValueNotifier<String> _metin = ValueNotifier<String>('asdfasd');

  void incrementCounter() {
    counter.value++;
    print(counter.value);
  }

  void incrementCounter2() {
    counter.value--;
    print(counter.value);
  }

  void incrementCounter3() {
    counter.value = 0;
    print(counter.value);
  }
}
