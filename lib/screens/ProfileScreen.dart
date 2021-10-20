import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/data/userData.dart';
import 'package:payuca_case_study/models/userData.dart';
import 'package:payuca_case_study/widgets/ActionTile.dart';
import 'package:payuca_case_study/widgets/DetailsLabel.dart';
import 'package:payuca_case_study/widgets/WhiteContainer.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Material(
      color: screenBackground,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 40.0),
                child: Text(
                  'Profile',
                  style: _textTheme.headline2!.merge(
                    const TextStyle(color: black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  'Personal details',
                  style: _textTheme.headline4!.merge(
                    const TextStyle(color: black),
                  ),
                ),
              ),
              WhiteContainer(
                child: Column(
                  children: <Widget>[
                    DetailsLabel(
                      title: currentUserData.name!,
                      editable: false,
                      icon: CupertinoIcons.person_fill,
                      label: 'Name',
                    ),
                    DetailsLabel(
                      title: currentUserData.email!,
                      editable: false,
                      icon: CupertinoIcons.mail_solid,
                      label: 'Email',
                    ),
                    DetailsLabel(
                      title: currentUserData.phoneNr!,
                      editable: false,
                      icon: CupertinoIcons.phone_fill,
                      label: 'Phone number',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
                child: Text(
                  'Personal details',
                  style: _textTheme.headline4!.merge(
                    const TextStyle(color: black),
                  ),
                ),
              ),
              if (currentUserData.licensePlate != null)
                DetailsLabel(
                  title: currentUserData.licensePlate!,
                  icon: CupertinoIcons.car_fill,
                )
              else
                ActionTile(
                  action: 'add',
                  title: 'Add license plate',
                  onTap: () => print('hey'),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
                child: Text(
                  'Help & Support',
                  style: _textTheme.headline4!.merge(
                    const TextStyle(color: black),
                  ),
                ),
              ),
              WhiteContainer(
                child: Column(
                  children: <Widget>[
                    DetailsLabel(
                      title: 'Help center',
                      icon: CupertinoIcons.question_circle_fill,
                      onTap: () =>
                          Navigator.pushNamed(context, 'HelpCenterScreen'),
                    ),
                    DetailsLabel(
                      title: 'Privacy Policy',
                      icon: CupertinoIcons.search_circle_fill,
                      onTap: () => Navigator.pushNamed(context, 'LegalScreen'),
                    ),
                    DetailsLabel(
                      title: 'Terms & Conditions',
                      icon: CupertinoIcons.square_list_fill,
                      onTap: () => Navigator.pushNamed(context, 'LegalScreen'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ActionTile(
                  action: 'exit',
                  title: 'Log out',
                  onTap: () => print(
                    'hello',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Align(
                  child: Text(
                    'Version 10.001',
                    style: _textTheme.subtitle1!.merge(
                      const TextStyle(color: mediumGrey),
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
