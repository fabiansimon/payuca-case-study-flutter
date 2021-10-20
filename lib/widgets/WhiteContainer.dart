import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';

class WhiteContainer extends StatefulWidget {
  Widget child;
  WhiteContainer({
    required this.child,
  });

  @override
  _WhiteContainerState createState() => _WhiteContainerState();
}

class _WhiteContainerState extends State<WhiteContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: widget.child,
    );
  }
}
