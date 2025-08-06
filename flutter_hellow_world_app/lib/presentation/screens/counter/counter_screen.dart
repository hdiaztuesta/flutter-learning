import 'package:flutter/material.dart';

class CounterScreeen extends StatefulWidget {
  const CounterScreeen({super.key});

  @override
  State<CounterScreeen> createState() => _CounterScreeenState();
}

class _CounterScreeenState extends State<CounterScreeen> {

  int clickCounter = 0;
  String labelCounter = 'Clicks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              clickCounter.toString(),
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            // Here you would typically use a BlocBuilder or similar to display the counter value
            Text(
              labelCounter, // Placeholder for counter value
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Here you would typically dispatch an event to increment the counter
          setState(() {
            clickCounter++;
            if (clickCounter == 1) {
              labelCounter = 'Click';
            } else {
              labelCounter = 'Clicks';
            } 
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
