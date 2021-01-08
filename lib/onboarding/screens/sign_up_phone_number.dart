import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/SignUpContainer.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/text_link.dart';
import 'package:flutter_application_1/helpers/color.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/onboarding/models/sign_up_model.dart';
import 'package:flutter_application_1/onboarding/screens/sign_up_email.dart';
import 'package:flutter_application_1/onboarding/screens/sign_up_password.dart';

class SignUpPhoneNumber extends StatefulWidget {
  final SignUpModel signUpModel;

  SignUpPhoneNumber({ this.signUpModel});

  @override
  _SignUpPhoneNumberState createState() => _SignUpPhoneNumberState();
}

class _SignUpPhoneNumberState extends State<SignUpPhoneNumber> {

  GlobalKey<FormState> _namekey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SignUpContainer(
        child: Material(
          child: Container(
            padding: EdgeInsets.only(top: 32, left: 32, right: 32, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height - 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Enter your phone number?',
                                  style: textStyleDMSan.copyWith(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Form(
                                    key: _namekey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          decoration: textDecoration.copyWith(
                                              hintText: 'Enter your phone number',
                                              prefixIcon: Icon(Icons.person)),
                                          controller: _name,
                                          validator: (val) {
                                            if (val.length == 11) {
                                              return null;
                                            }

                                            return 'Please enter your phone number and must be 11 digits';
                                          },
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        AppButton(
                                          title: 'Next',
                                          onPress: () {
                                            widget.signUpModel.phoneNumber = _name.text;

                                            if (_namekey.currentState
                                                .validate()) {

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignUpEmail( signUpModel: widget.signUpModel,)));
                                            }
                                          },
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: TextLink(
                              title: 'Have an account? Log In',
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
