import 'package:flutter/material.dart';

import 'package:beetle/utilities/constants.dart';

class RoundIconButton extends StatefulWidget {
  final int index;
  const RoundIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.index,
  }) : super(key: key);
  final void Function(int value) onPressed;
  final String icon;

  @override
  State<RoundIconButton> createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {
  double elevation = 0;
  bool itemSelected = false;
  double? radius = 35;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: RawMaterialButton(
        elevation: elevation,
        onPressed: () {
          widget.onPressed(widget.index);
          itemSelected = !itemSelected;
          if (itemSelected) {
            setState(() {
              elevation = 40;
              radius = 40;
            });
          } else {
            setState(() {
              elevation = 0;
              radius = 35;
            });
          }
        },
        fillColor: Colors.white,
        child: CircleAvatar(
          backgroundImage: AssetImage(widget.icon),
          backgroundColor: Colors.white,
          radius: radius,
        ),
        shape: const CircleBorder(),
        constraints: kSizeConstraints,
      ),
    );
  }
}
