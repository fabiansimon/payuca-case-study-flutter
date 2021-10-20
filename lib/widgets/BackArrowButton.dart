import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';

class BackArrowButton extends StatefulWidget {
  BackArrowButton({
    required this.onTap,
  });
  Function() onTap;
  @override
  _BackArrowButtonState createState() => _BackArrowButtonState();
}

class _BackArrowButtonState extends State<BackArrowButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: const Icon(
        CupertinoIcons.arrow_left,
        color: black,
        size: 22,
      ),
    );
  }
}
