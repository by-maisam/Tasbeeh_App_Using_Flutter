import 'package:flutter/material.dart';
import 'package:flutter_app1/counter_page.dart';
import 'package:flutter_app1/zikr_list_page.dart';
import 'package:flutter_app1/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectedBottomIndex = 0;
List<Widget> pageList = [CounterPage(), ZikrListpage(), SettingsPage()];

class _HomePageState extends State<HomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasbeeh Counter'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                counter = 0;
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: pageList[selectedBottomIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: selectedBottomIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedBottomIndex = value;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.add), label: "Counter"),
          NavigationDestination(icon: Icon(Icons.list), label: "Zikr List "),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
