import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';

class DetailsLabel extends StatefulWidget {
  DetailsLabel({
    this.icon,
    this.label,
    this.onTap,
    required this.title,
    this.lPosition = 'top',
    this.editable = true,
    this.twoLines = false,
  });
  IconData? icon;
  Function()? onTap;
  String? label;
  String title;
  String lPosition;
  bool editable;
  bool twoLines;

  @override
  _DetailsLabelState createState() => _DetailsLabelState();
}

class _DetailsLabelState extends State<DetailsLabel> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    final Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      onTapDown: (_) {
        setState(() {
          if (widget.editable) _isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          if (widget.editable) _isTapped = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          if (widget.editable) _isTapped = false;
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
              if (widget.icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Icon(
                    widget.icon,
                    color: blue,
                    size: 20,
                  ),
                ),
              Expanded(
                child: Column(
                  verticalDirection: widget.lPosition != 'top'
                      ? VerticalDirection.up
                      : VerticalDirection.down,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (widget.label != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          widget.label!,
                          style: _textTheme.subtitle2!.merge(
                            const TextStyle(color: darkGrey),
                          ),
                        ),
                      ),
                    Text(
                      widget.title,
                      maxLines: widget.twoLines ? 2 : 1,
                      style: _textTheme.headline4!.merge(
                        const TextStyle(color: black),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.editable)
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Icon(
                    CupertinoIcons.chevron_right,
                    size: 15,
                    color: mediumGrey,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
