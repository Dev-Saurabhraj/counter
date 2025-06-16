import 'package:counter/ui_works/counter_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyCounterApp());
}

class MyCounterApp extends StatefulWidget {
  const MyCounterApp({super.key});

  @override
  State<MyCounterApp> createState() => _MyCounterAppState();
}

class _MyCounterAppState extends State<MyCounterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterUi(),
    );
  }
}

