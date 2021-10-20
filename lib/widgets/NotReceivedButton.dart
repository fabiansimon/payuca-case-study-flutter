import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';

class NotReceivedButton extends StatefulWidget {
  NotReceivedButton({
    required this.onTap,
  });
  Function() onTap;
  @override
  _NotReceivedButtonState createState() => _NotReceivedButtonState();
}

class _NotReceivedButtonState extends State<NotReceivedButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
      },
      child: Text(
        'Did not receive a code by email?',
        style: _textTheme.headline4!.merge(
          TextStyle(
            color: _isTapped ? lightBlue : blue,
          ),
        ),
      ),
    );
  }
}
