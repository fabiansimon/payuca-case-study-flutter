import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/screens/GarageScreen.dart';
import 'package:payuca_case_study/screens/ProfileScreen.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _isActive = 0;
  final PageController _controller = PageController();

  final List<Widget> _pages = <Widget>[
    GarageScreen(),
    ProfileScreen(),
  ];

  void _switchPage(int page) {
    if (_isActive != page) _controller.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        onPageChanged: (int value) {
          setState(() {
            _isActive = value;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavBar(_textTheme),
    );
  }

  Container _buildBottomNavBar(TextTheme _textTheme) {
    return Container(
      decoration: const BoxDecoration(color: white),
      height: 88,
      child: Column(
        children: <Widget>[
          const Divider(
            height: 0,
            thickness: 1,
            color: lightGrey,
          ),
          const SizedBox(height: 10),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () => _switchPage(0),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.house_fill,
                        size: 20,
                        color: _isActive == 0 ? blue : mediumGrey,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Garage',
                        style: _textTheme.caption!.merge(
                          TextStyle(color: _isActive == 0 ? blue : mediumGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _switchPage(1),
                child: Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.person_crop_circle_fill,
                          size: 20,
                          color: _isActive == 1 ? blue : mediumGrey,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Profile',
                          style: _textTheme.caption!.merge(
                            TextStyle(
                                color: _isActive == 1 ? blue : mediumGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
