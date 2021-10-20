import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/models/FAQData.dart';
import 'package:payuca_case_study/widgets/BackArrowButton.dart';

class FAQScreen extends StatefulWidget {
  FAQScreen({
    required this.faq,
  });
  FAQ faq;
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
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
                padding: const EdgeInsets.only(top: 15.0, bottom: 40.0),
                child: Text(
                  widget.faq.title,
                  style: _textTheme.headline2!.merge(
                    const TextStyle(
                      color: black,
                    ),
                  ),
                ),
              ),
              Text(
                widget.faq.answer,
                style: _textTheme.bodyText1!.merge(
                  const TextStyle(
                    color: black,
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
