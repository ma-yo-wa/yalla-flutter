import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/text_link.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/onboarding/screens/sign_up_name.dart';

class FirstPageOnboarding extends StatefulWidget {
  @override
  _FirstPageOnboardingState createState() => _FirstPageOnboardingState();
}

class _FirstPageOnboardingState extends State<FirstPageOnboarding> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Material(
      child: SingleChildScrollView(
        child: Container(
            color: Color(0xffBBE0D2),
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find your perfect\nHajj & Umrah plan',
                        style: textStyleInter.copyWith(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Make the spiritual journey\nof a lifetime',
                        style: textStyleInter.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff436969)),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Image(
                    image: AssetImage('assets/images/prayerGround.png'),
                  ),
                ),
                Container(
                  width: width,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: width,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 18,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Color(0xff00A568),
                                  borderRadius: BorderRadius.circular(60)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 10,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AppButton(
                        title: 'Get Started',
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpName()));
                        },
                      ),
                     SizedBox(height: 20,),
                     TextLink(),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
