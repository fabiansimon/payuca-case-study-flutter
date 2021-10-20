import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';

class CustomSnackBar extends StatefulWidget {
  CustomSnackBar({
    required this.type,
    this.twoLine = false,
    this.close = true,
    required this.string,
    this.onDismiss,
  });
  String string;
  String type;
  bool twoLine;
  bool close;
  Function()? onDismiss;
  @override
  _CustomSnackBarState createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  int intType() {
    switch (widget.type) {
      case 'confirmation':
        return 0;

      case 'error':
        return 1;

      case 'warning':
        return 2;

      case 'premission':
        return 3;

      default:
        return 0;
    }
  }

  // int typeInt = getType();

  final List<IconData> _icons = <IconData>[
    CupertinoIcons.check_mark_circled_solid,
    CupertinoIcons.exclamationmark_circle_fill,
    CupertinoIcons.exclamationmark_triangle_fill,
    CupertinoIcons.hourglass_tophalf_fill,
  ];

  final List<Color> _colors = <Color>[confirmation, error, warning, darkGrey];

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: _colors[intType()],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                _icons[intType()],
                color: intType() != 2 ? white : black,
              ),
            ),
            Expanded(
              child: Text(
                widget.string,
                maxLines: widget.twoLine ? 2 : 1,
                style: _textTheme.bodyText2!.merge(
                  TextStyle(
                    color: intType() != 2 ? white : black,
                  ),
                ),
              ),
            ),
            if (widget.close)
              GestureDetector(
                onTap: () {
                  if (widget.onDismiss != null) widget.onDismiss!();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(
                    CupertinoIcons.xmark,
                    color: intType() != 2 ? white : black,
                    size: 18,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
