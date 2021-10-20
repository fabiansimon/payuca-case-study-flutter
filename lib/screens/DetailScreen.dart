import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/data/userData.dart';
import 'package:payuca_case_study/models/userData.dart';
import 'package:payuca_case_study/widgets/BackArrowButton.dart';
import 'package:payuca_case_study/widgets/DetailsLabel.dart';
import 'package:payuca_case_study/widgets/WhiteContainer.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Material(
      color: screenBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 14.0),
              child: BackArrowButton(
                onTap: () => Navigator.pop(context),
              ),
            ),
            Text(
              'Details',
              style: _textTheme.headline2!.merge(
                const TextStyle(color: black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 15),
              child: Text(
                'Garage Details',
                style: _textTheme.headline3!.merge(
                  const TextStyle(color: black),
                ),
              ),
            ),
            WhiteContainer(
              child: Column(
                children: <Widget>[
                  DetailsLabel(
                    label: 'Name',
                    editable: false,
                    twoLines: true,
                    icon: CupertinoIcons.house_fill,
                    title: currentUserData.parkingData.name,
                  ),
                  DetailsLabel(
                    label: 'Address',
                    editable: false,
                    twoLines: true,
                    icon: CupertinoIcons.pin_fill,
                    title: currentUserData.parkingData.address,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 15),
              child: Text(
                'Garage Details',
                style: _textTheme.headline3!.merge(
                  const TextStyle(color: black),
                ),
              ),
            ),
            WhiteContainer(
              child: Column(
                children: <Widget>[
                  DetailsLabel(
                    label: 'Valid from',
                    editable: false,
                    icon: CupertinoIcons.calendar,
                    title: currentUserData.parkingData.validFrom,
                  ),
                  DetailsLabel(
                    label: 'Valid until',
                    editable: false,
                    icon: CupertinoIcons.calendar_today,
                    title: currentUserData.parkingData.validUntil,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
