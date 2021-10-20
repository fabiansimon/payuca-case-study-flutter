import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';

class ActionTile extends StatefulWidget {
  String action;
  String title;
  Function() onTap;
  ActionTile({
    required this.action,
    required this.title,
    required this.onTap,
  });

  @override
  _ActionTileState createState() => _ActionTileState();
}

class _ActionTileState extends State<ActionTile> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    Color _color = widget.action == 'add' ? blue : error;

    final TextTheme _textTheme = Theme.of(context).textTheme;
    final Size _size = MediaQuery.of(context).size;
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
      child: Container(
        constraints: const BoxConstraints(minHeight: 68),
        width: _size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: white,
        ),
        child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: _isTapped ? textFieldBackground : white,
          ),
          child: Row(
            children: <Widget>[
              if (widget.action == 'add')
                Icon(
                  CupertinoIcons.add,
                  color: _color,
                )
              else
                Icon(
                  CupertinoIcons.square_arrow_right,
                  color: _color,
                  size: 20,
                ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.title,
                  style: _textTheme.headline4!.merge(
                    TextStyle(color: _color),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
