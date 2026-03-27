import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  late final SharedPreferences prefs;
  void loadcounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt("my_counter") ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    loadcounter();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  counter = 0;
                });
                prefs.setInt("my_counter", 0);
              },
              label: Text("Reset"),
              icon: Icon(Icons.refresh),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      width: 20,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text("$counter", style: TextStyle(fontSize: 80)),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: FilledButton.tonal(
                  onPressed: () {
                    if (counter > 0) {
                      setState(() {
                        counter--;
                      });
                      prefs.setInt("my_counter", counter);
                    }
                  },
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Icon(Icons.remove),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 3,
                child: FilledButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                    prefs.setInt("my_counter", counter);
                  },
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
