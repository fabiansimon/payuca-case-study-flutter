import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/widgets/BackArrowButton.dart';
import 'package:payuca_case_study/widgets/NotReceivedButton.dart';
import 'package:payuca_case_study/widgets/PrimaryButton.dart';

class EmailScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _controller = TextEditingController();
  final PageController _pageController = PageController();

  // For PageView Animation
  final Duration _duration = const Duration(milliseconds: 300);
  final Cubic _curve = Curves.linearToEaseOut;

  // Checkboxes
  bool _tcBox = false;
  bool _ppBox = false;

  // Allow to press 'Verify Email' Button
  bool _canVerify = false;

  void _checkField() {
    if (_ppBox && _tcBox && _controller.text.isNotEmpty) {
      setState(() {
        _canVerify = false;
      });
    } else {
      setState(() {
        _canVerify = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Material(
      color: white,
      child: SafeArea(
          child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          _buildEmailView(_textTheme, context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: BackArrowButton(
                          onTap: () => _pageController.animateToPage(
                            0,
                            duration: _duration,
                            curve: _curve,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 10),
                        child: Text(
                          'Verification Code',
                          style: _textTheme.headline2!.merge(
                            const TextStyle(color: black),
                          ),
                        ),
                      ),
                      Text(
                        'An email verification code has been sent to personal@mail.com',
                        style: _textTheme.bodyText1!.merge(
                          const TextStyle(
                            color: black,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 40,
                          ),
                          height: 84,
                          width: 260,
                          decoration: const BoxDecoration(
                            color: textFieldBackground,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: NotReceivedButton(
                          onTap: () =>
                              Navigator.pushNamed(context, 'TabNavigator'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Padding _buildEmailView(TextTheme _textTheme, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  'Enter your email',
                  style: _textTheme.headline2!.merge(
                    const TextStyle(color: black),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'If you were invited via email, use that address.',
                  style: _textTheme.bodyText1!.merge(
                    const TextStyle(
                      color: black,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: const BoxDecoration(
                    color: textFieldBackground,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: TextFormField(
                    controller: _controller,
                    onChanged: (_) => _checkField(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      focusColor: error,
                      labelText: 'Email address',
                      labelStyle: _textTheme.bodyText1!.merge(
                        const TextStyle(color: mediumGrey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Checkbox(
                      visualDensity: VisualDensity.compact,
                      value: _tcBox,
                      onChanged: (bool? value) {
                        _tcBox = value!;
                        _checkField();
                      },
                    ),
                    Text(
                      'I have read and accept the ',
                      style: _textTheme.bodyText2!.merge(
                        const TextStyle(color: darkGrey),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'LegalScreen'),
                      child: Text(
                        'Privacy Policy',
                        style: _textTheme.bodyText2!.merge(
                          const TextStyle(color: blue),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      visualDensity: VisualDensity.compact,
                      value: _ppBox,
                      onChanged: (bool? value) {
                        _ppBox = value!;
                        _checkField();
                      },
                    ),
                    Text(
                      'I have read and accept the ',
                      style: _textTheme.bodyText2!.merge(
                        const TextStyle(color: darkGrey),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'LegalScreen'),
                      child: Text(
                        'Terms & Conditions',
                        style: _textTheme.bodyText2!.merge(
                          const TextStyle(color: blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PrimaryButton(
              title: 'Verify email',
              onTap: () => _pageController.animateToPage(
                1,
                duration: _duration,
                curve: _curve,
              ),
              isInactive: _canVerify,
            ),
          ],
        ),
      ),
    );
  }
}
