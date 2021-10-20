import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';

class PrimaryButton extends StatefulWidget {
  String title;
  IconData? icon;
  bool isInactive;
  Function() onTap;
  PrimaryButton({
    required this.title,
    this.icon,
    this.isInactive = false,
    required this.onTap,
  });

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        if (!widget.isInactive) widget.onTap();
      },
      onTapDown: (_) {
        setState(() {
          if (!widget.isInactive) _isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          if (!widget.isInactive) _isTapped = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          if (!widget.isInactive) _isTapped = false;
        });
      },
      child: Opacity(
        opacity: widget.isInactive ? 0.2 : 1,
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: const Offset(0, 1),
                color: Colors.black.withOpacity(.2),
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: _isTapped ? blueActive : blue,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (widget.icon != null)
                  Icon(
                    widget.icon,
                    color: white,
                    size: 20,
                  ),
                if (widget.icon != null)
                  const SizedBox(
                    width: 10,
                  ),
                Text(
                  widget.title,
                  style: textTheme.headline4!.merge(
                    const TextStyle(color: white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
