import 'package:flutter/material.dart';

class CounterFunctionsScreeen extends StatefulWidget {
  const CounterFunctionsScreeen({super.key});

  @override
  State<CounterFunctionsScreeen> createState() =>
      _CounterFunctionsScreeenState();
}

class _CounterFunctionsScreeenState extends State<CounterFunctionsScreeen> {
  int clickCounter = 0;
  String labelCounter = 'Clicks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter functions screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
                labelCounter = 'Clicks';
              });
            },
          ),
        ],
      ),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh_rounded,
            onPressed: () {
              clickCounter = 0;
              labelCounter = 'Clicks';

              setState(() {});
            },
          ),
          SizedBox(height: 10),
          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              clickCounter++;
              if (clickCounter == 1) {
                labelCounter = 'Click';
              } else {
                labelCounter = 'Clicks';
              }

              setState(() {});
            },
          ),
          SizedBox(height: 10),
          CustomButton(
            icon: Icons.exposure_minus_1_rounded,
            onPressed: () {
              if (clickCounter == 0) return;

              clickCounter--;
              if (clickCounter == 1) {
                labelCounter = 'Click';
              } else {
                labelCounter = 'Clicks';
              }

              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: StadiumBorder(),
      onPressed: onPressed,
      enableFeedback: true,
      elevation: 5,
      child: Icon(icon),
    );
  }
}
