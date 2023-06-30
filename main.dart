import 'package:calculator/appbar_icon.dart';
import 'package:calculator/counterState.dart';
import 'package:calculator/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  InitGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  // valuenatufier değer verme işlemi direk 0 değeri veremezsin çünkü bu değişken int değil
  @override
  void initState() {
    super.initState();
    final state1 = getIt.get<counterState>();
    //add listener counter sürekli dinler içindeki değişiklik olunca içindeki fonksiyonu yapar.
    state1.counter.addListener(() {
      if (state1.counter.value % 10 == 0 && state1.counter.value > 0) {
        _showMyDialog();
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('resetle'),
              onPressed: () {
                Navigator.of(context).pop();
                final state1 = getIt.get<counterState>();
                state1.incrementCounter3();
              },
            ),
            TextButton(
              child: const Text('devam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [appBarIcon()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder<int>(
                valueListenable: getIt.get<counterState>().counter,
                builder: (context, listenCounter, child) {
                  print('builder çalışıryor');
                  return Text('$listenCounter',
                      style: TextStyle(
                        color: listenCounter > 0 ? Colors.green : Colors.red,
                      ));
                }),
            ElevatedButton(
                onPressed: () {
                  final state1 = getIt.get<counterState>();
                  state1.incrementCounter();
                },
                child: Text('artır')),
            ElevatedButton(
                onPressed: () {
                  final state1 = getIt.get<counterState>();
                  state1.incrementCounter2();
                },
                child: Text('azalt')),
            ElevatedButton(
                onPressed: () {
                  final state1 = getIt.get<counterState>();
                  state1.incrementCounter3();
                },
                child: Text('sıfırla')),
          ],
        ),
      ),
    );
  }
}
