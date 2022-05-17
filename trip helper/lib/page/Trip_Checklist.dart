import 'package:flutter/material.dart';

class Trip_Checklist extends StatefulWidget {
  @override
  State<Trip_Checklist> createState() => _Trip_Checklist();
}

/// State for MyApp

class _Trip_Checklist extends State<Trip_Checklist> {
  Map<String, bool?> List = {
    'Passport': false,
    'ID': false,
    'Flight ticket': false,
    'Train ticket': false,
    'Hotel reservation': false,
    'Phone changer': false,
    'Cash': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Checklist'),
        centerTitle: true,
      ),
      body: ListView(
        children: List.keys.map((String key) {
          return new CheckboxListTile(
            title: Text(key),
            value: List[key],
            onChanged: (bool? value) {
              setState(() {
                List[key] = value;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
