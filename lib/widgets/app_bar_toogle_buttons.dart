import 'package:flutter/material.dart';

class AppBarToogleButtons extends StatelessWidget {
  final List<bool> isSelected;
  final Function onPressed;

  const AppBarToogleButtons({
    this.isSelected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      child: ToggleButtons(
        fillColor: Colors.white,
        renderBorder: true,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        children: [
          Padding(
            padding: const EdgeInsets.all(1),
            child: Image.asset(
              'assets/images/logo-breaking-bad.png',
              fit: BoxFit.cover
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/logo-better-caul-saul.png',
              fit: BoxFit.cover
            ),
          ),
        ],
        selectedColor: Colors.black54,
        isSelected: isSelected,
        onPressed: onPressed,
      ),
    );
  }
}
