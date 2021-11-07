import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';

class CodeContainer extends StatefulWidget {
  CodeContainer({
    required this.controller,
    required this.textInputAction,
  });
  TextEditingController controller;
  TextInputAction textInputAction;

  @override
  _CodeContainerState createState() => _CodeContainerState();
}

class _CodeContainerState extends State<CodeContainer> {
  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: 50,
      height: 90,
      child: TextField(
        keyboardType: TextInputType.number,
        controller: widget.controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: _textTheme.overline!.merge(
          const TextStyle(color: black),
        ),
        cursorHeight: 0,
        textInputAction: widget.textInputAction, // Moves focus to next.
        decoration: InputDecoration(
          hintStyle: _textTheme.overline!.merge(
            const TextStyle(color: lightGrey),
          ),
          hintText: '0',
          counterText: '',
        ),
      ),
    );
  }
}
