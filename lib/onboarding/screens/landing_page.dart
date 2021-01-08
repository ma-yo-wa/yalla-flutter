import 'package:flutter/material.dart';
import 'package:flutter_application_1/onboarding/screens/first_onboarding.dart';
import 'package:flutter_application_1/onboarding/screens/second_onboarding.dart';

class HomeLanding extends StatefulWidget {
  @override
  _HomeLandingState createState() => _HomeLandingState();
}

class _HomeLandingState extends State<HomeLanding> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: PageView(
          controller: _controller,
          children: [
            FirstPageOnboarding(),
            SecondPageOnboarding(),
          ],
        ),
      ),
    );
  }
}
