
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubes_provis/constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: () {
        onPress();
      },
      elevation: 10.0,
      constraints: BoxConstraints(minHeight: 40.0, minWidth: 40.0),
      fillColor: kHijau,
      child: Icon(icon),
    );
  }
}
