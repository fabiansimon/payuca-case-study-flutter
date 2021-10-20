import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';

class ParkingSpaceTile extends StatefulWidget {
  String number;
  String level;
  bool permission;
  Function() onTap;
  ParkingSpaceTile({
    required this.number,
    required this.level,
    this.permission = true,
    required this.onTap,
  });
  @override
  _ParkingSpaceTileState createState() => _ParkingSpaceTileState();
}

class _ParkingSpaceTileState extends State<ParkingSpaceTile> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        if (widget.permission) widget.onTap();
      },
      onTapDown: (_) {
        setState(() {
          if (widget.permission) _isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          if (widget.permission) _isTapped = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          if (widget.permission) _isTapped = false;
        });
      },
      child: Opacity(
        opacity: !widget.permission ? 0.2 : 1,
        child: Container(
          height: 76,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: white,
          ),
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                color: _isTapped ? textFieldBackground : white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: const EdgeInsets.all(4),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Number',
                        style: textTheme.subtitle2!.merge(
                          const TextStyle(color: darkGrey),
                        ),
                      ),
                      Text(
                        widget.number,
                        style: textTheme.headline2!.merge(
                          const TextStyle(color: black),
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(
                    color: lightGrey,
                    thickness: 1,
                    width: 20,
                    endIndent: 12,
                    indent: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Level',
                        style: textTheme.subtitle2!.merge(
                          const TextStyle(color: darkGrey),
                        ),
                      ),
                      Text(
                        widget.level,
                        style: textTheme.headline2!.merge(
                          const TextStyle(color: black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
