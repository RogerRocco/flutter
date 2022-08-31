import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Text _text = const Text("");

  @override
  Widget build(BuildContext context) {
    (() async {
      String data = await rootBundle.loadString('assets/data.json');
      var jsonAssets = json.decode(data);
      setState(() {
        _text = Text(
          jsonAssets["firstName"] + " " + jsonAssets["lastName"],
          style: Theme.of(context).textTheme.titleLarge,
        );
      });
    })();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _text,
            ),
            Image.asset('assets/emoji.png', width: 300, height: 150)
          ],
        ),
      ),
    );
  }
}
