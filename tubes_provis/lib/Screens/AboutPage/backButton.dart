import 'package:flutter/material.dart';

class backButton extends StatelessWidget {
  final Widget child;
  const backButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 20,
            left: 10,
            child: Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
          ),


          child,
        ],
      ),
    );
  }
}