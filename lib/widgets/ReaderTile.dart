import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/models/reader.dart';
import 'package:payuca_case_study/widgets/PrimaryButton.dart';

class ReaderTile extends StatefulWidget {
  ReaderTile({
    required this.reader,
    this.onTap,
    this.onTapButton,
    this.permission = true,
  });
  bool permission;
  Reader reader;
  Function()? onTap;
  Function()? onTapButton;

  @override
  _ReaderTileState createState() => _ReaderTileState();
}

class _ReaderTileState extends State<ReaderTile> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return Opacity(
      opacity: widget.permission ? 1 : 0.2,
      child: Container(
        height: 76,
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.reader.title,
                      style: _textTheme.headline4!.merge(
                        const TextStyle(color: black),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (widget.onTap != null) {
                          widget.onTap!();
                        }
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
                        'See details',
                        style: _textTheme.bodyText2!.merge(
                          TextStyle(
                              color: _isTapped ? blue.withOpacity(.2) : blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.reader.isOpen!)
                const Flexible(
                  child: Center(
                    child: Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      size: 30,
                      color: confirmation,
                    ),
                  ),
                )
              else
                Flexible(
                  child: widget.reader.isLoading!
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : PrimaryButton(
                          title: 'Open',
                          onTap: () {
                            if (widget.onTap != null) {
                              widget.onTapButton!();
                            }
                          },
                        ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
