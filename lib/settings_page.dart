import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool issoundenabled = false;
  late bool isvibrationenabled = false;
  late final SharedPreferences prefs;
  void loadsettingsfromprefs() async {
    prefs = await SharedPreferences.getInstance();
    issoundenabled = prefs.getBool("is_sound") ?? false;
    isvibrationenabled = prefs.getBool("is_vibrate") ?? false;
  }

  void initState() {
    super.initState();
    loadsettingsfromprefs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SwitchListTile(
            value: false,
            onChanged: (value) {
              setState(() {
                issoundenabled = value;
              });
              prefs.setBool("is_sound", value);
            },
            title: Text("Sounds"),
          ),
          SwitchListTile(
            value: false,
            onChanged: (value) {
              setState(() {
                isvibrationenabled = value;
              });
              prefs.setBool("is_vibrate", value);
            },
            title: Text("Vibrations"),
          ),
        ],
      ),
    );
  }
}
