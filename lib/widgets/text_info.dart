import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  final String label;

  const TextInfo({
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
