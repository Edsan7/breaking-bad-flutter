import 'package:breaking_bad/widgets/text_info.dart';
import 'package:flutter/material.dart';

class TextListView extends StatelessWidget {
  final String label;

  const TextListView({
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(
            Icons.arrow_right,
          ),
        ),
        TextInfo(
          label: label,
        ),
      ],
    );
  }
}
