import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard/screens/dashboard.dart';
import 'package:flutter_application_1/account/screens/account.dart';
import 'package:flutter_application_1/helpers/color.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/how_to/screens/how_to.dart';
import 'package:flutter_application_1/onboarding/screens/login.dart';
import 'package:flutter_application_1/payment/screens/saving.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  List<Widget> currentRender = [
    Dashboard(),
    Savings(),
    HowTo(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 15,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: primaryColor,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard),
              label: 'Saving'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_work),
              label: 'HowTo'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account'
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
            future: checkIfAuth(),
            initialData: {"token": null},
            builder: (context, text) {
              return text.data["token"] != null
                  ? currentRender[_currentIndex]
                  : Login();
            }),
      ),
    ));
  }
}
