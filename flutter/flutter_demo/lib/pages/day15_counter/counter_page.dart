import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void _increment() {
    setState(() {
      count += 1;
    });
  }

  void _decrement() {
    setState(() {
      count -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Day 15 -- 计数器"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "当前计数",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "$count",
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed:_decrement, child: const Text("-")),
                  const SizedBox(width: 20,),
                  ElevatedButton(onPressed:_increment, child: const Text("+"),)
                ],
              )
            ],
          ),
        ));
  }
}
