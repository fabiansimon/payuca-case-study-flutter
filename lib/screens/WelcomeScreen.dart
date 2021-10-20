import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/widgets/PrimaryButton.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Material(
      color: screenBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(),
              Center(
                child: Image.asset(
                  'assets/payuca-logo.png',
                  width: 200,
                  height: 52,
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Welcome to your Access App',
                    style: _textTheme.bodyText1!.merge(
                      const TextStyle(color: darkGrey),
                    ),
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    title: 'Get started',
                    onTap: () => Navigator.pushNamed(context, 'EmailScreen'),
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
