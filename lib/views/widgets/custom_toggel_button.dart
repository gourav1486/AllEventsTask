import 'package:flutter/material.dart';
class IconToggleButton extends StatefulWidget {
  @override
  _IconToggleButtonState createState() => _IconToggleButtonState();
}

class _IconToggleButtonState extends State<IconToggleButton> {
  List<bool> _isSelected = [false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: _isSelected,
      onPressed: (int index) {
        setState(() {
          _isSelected[index] = !_isSelected[index];
        });
      },
      children: [
        Icon(Icons.favorite),
        Icon(Icons.bookmark),
      ],
    );
  }
}
