import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/data/FAQData.dart';
import 'package:payuca_case_study/models/FAQData.dart';
import 'package:payuca_case_study/screens/FAQScreen.dart';
import 'package:payuca_case_study/widgets/BackArrowButton.dart';
import 'package:payuca_case_study/widgets/DetailsLabel.dart';
import 'package:payuca_case_study/widgets/WhiteContainer.dart';

class HelpCenterScreen extends StatefulWidget {
  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Material(
      color: screenBackground,
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
                  'Hi, how can we help you?',
                  style: _textTheme.headline2!.merge(
                    const TextStyle(color: black),
                  ),
                ),
              ),
              Text(
                'Get help',
                style: _textTheme.headline4!.merge(
                  const TextStyle(color: black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                child: WhiteContainer(
                  child: Column(
                    children: <Widget>[
                      DetailsLabel(
                        title: 'Email us',
                        label:
                            'Send suggestions or report issues to payucal@support.com',
                        lPosition: 'bottom',
                        icon: CupertinoIcons.mail_solid,
                      ),
                      DetailsLabel(
                        title: 'Call us',
                        label: '24h emergency hotline*',
                        lPosition: 'bottom',
                        icon: Icons.headset_mic_rounded,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  '*Calls from Austria are free or charge. Calls from Germany cost 0,19€/min',
                  style: _textTheme.subtitle2!.merge(
                    const TextStyle(color: darkGrey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
                child: Text(
                  'Select an issue',
                  style: _textTheme.headline4!.merge(
                    const TextStyle(color: black),
                  ),
                ),
              ),
              WhiteContainer(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: faqData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DetailsLabel(
                      title: faqData[index].title,
                      twoLines: true,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => FAQScreen(
                            faq: faqData[index],
                          ),
                        ),
                      ),
                    );
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
