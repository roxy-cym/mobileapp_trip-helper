import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String _lt, _ht;
  final IconData _icon;

  Editor(this._controller, this._lt, this._ht, this._icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        style: TextStyle(
          fontSize: 15,
          color: Colors.blueGrey,
        ),
        decoration: InputDecoration(
          icon: Icon(_icon),
          labelText: _lt,
          hintText: _ht,
        ),
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}
