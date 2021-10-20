import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/models/reader.dart';
import 'package:payuca_case_study/widgets/BackArrowButton.dart';

class ReaderDetail extends StatefulWidget {
  ReaderDetail({
    required this.reader,
  });
  Reader reader;
  @override
  _ReaderDetailState createState() => _ReaderDetailState();
}

class _ReaderDetailState extends State<ReaderDetail> {
  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Material(
      color: white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BackArrowButton(
                onTap: () => Navigator.pop(context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 40.0),
                child: Text(
                  widget.reader.title,
                  style: _textTheme.headline2!.merge(
                    const TextStyle(color: black),
                  ),
                ),
              ),
              Text(
                'Location',
                style: _textTheme.headline4!.merge(
                  const TextStyle(color: black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 32.0),
                child: Text(
                  widget.reader.location! != ''
                      ? widget.reader.location!
                      : 'No information available.',
                  style: _textTheme.bodyText1!.merge(
                    TextStyle(
                      color: widget.reader.location! != '' ? black : mediumGrey,
                    ),
                  ),
                ),
              ),
              Text(
                'Information',
                style: _textTheme.headline4!.merge(
                  const TextStyle(color: black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 32.0),
                child: Text(
                  widget.reader.information! != ''
                      ? widget.reader.information!
                      : 'No information available.',
                  style: _textTheme.bodyText1!.merge(
                    TextStyle(
                      color:
                          widget.reader.information! != '' ? black : mediumGrey,
                    ),
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
