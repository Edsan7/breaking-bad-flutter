import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  final Color backgroundColor;
  final Animation<Color> valueColor;

  const CircularLoading({
    this.backgroundColor = Colors.white60,
    @required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
        valueColor: valueColor,
      ),
    );
  }
}
