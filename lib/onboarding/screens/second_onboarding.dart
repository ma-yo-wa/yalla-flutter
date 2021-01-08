import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/text_link.dart';
import 'package:flutter_application_1/helpers/util.dart';

class SecondPageOnboarding extends StatefulWidget {
  @override
  _SecondPageOnboardingState createState() => _SecondPageOnboardingState();
}

class _SecondPageOnboardingState extends State<SecondPageOnboarding> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Material(
      child: SingleChildScrollView(
        child: Container(
            color: Color(0xff156863),
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pay at once or save\nin bits for your trip', style: textStyleInter.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF)
                      ),),
                      SizedBox(height: 16,),
                      Text('Save in bits towards your trip', style: textStyleInter.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffACD4E0)
                      ),)
                    ],
                  ),
                ),
                Container(
                  child: Image(
                    image: AssetImage('assets/images/wallet.png'),
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
                              width: 10,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60)
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width: 18,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Color(0xff00A568),
                                  borderRadius: BorderRadius.circular(60)
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      AppButton(
                        title: 'Get Started',
                        onPress: (){},
                      ),
                      SizedBox(height: 20,),
                      TextLink(),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
