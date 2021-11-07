import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/widgets/BackArrowButton.dart';
import 'package:payuca_case_study/widgets/CodeContainer.dart';
import 'package:payuca_case_study/widgets/NotReceivedButton.dart';
import 'package:payuca_case_study/widgets/PrimaryButton.dart';

class EmailScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _controller = TextEditingController();
  final PageController _pageController = PageController();
  final List<TextEditingController> _codeControllers = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

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
          _buildVerificationView(_textTheme, context),
        ],
      )),
    );
  }

  Padding _buildVerificationView(TextTheme _textTheme, BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 42.0,
                    right: 42.0,
                    bottom: 40.0,
                    top: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CodeContainer(
                        controller: _codeControllers[0],
                        textInputAction: TextInputAction.next,
                      ),
                      CodeContainer(
                        controller: _codeControllers[1],
                        textInputAction: TextInputAction.next,
                      ),
                      CodeContainer(
                        controller: _codeControllers[2],
                        textInputAction: TextInputAction.next,
                      ),
                      CodeContainer(
                        controller: _codeControllers[3],
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: NotReceivedButton(
                    onTap: () => Navigator.pushNamed(context, 'TabNavigator'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: TextFormField(
                    validator: (String? val) =>
                        !EmailValidator.validate(val!, true)
                            ? 'Invalid email address'
                            : null,
                    controller: _controller,
                    onChanged: (_) => _checkField(),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: textFieldBackground,
                      filled: true,
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
              onTap: () {
                _pageController.animateToPage(
                  1,
                  duration: _duration,
                  curve: _curve,
                );
              },
              isInactive: _canVerify,
            ),
          ],
        ),
      ),
    );
  }
}
