import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/SignUpContainer.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/text_link.dart';
import 'package:flutter_application_1/helpers/color.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/onboarding/models/sign_up_model.dart';
import 'package:flutter_application_1/onboarding/screens/sign_up_password.dart';

class SignUpEmail extends StatefulWidget {
  SignUpModel signUpModel;

  SignUpEmail({this.signUpModel});

  @override
  _SignUpEmailState createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
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
                                  'What’s your email address?',
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
                                              hintText:
                                                  'Enter your email address',
                                              prefixIcon:
                                                  Icon(Icons.email_outlined)),
                                          controller: _name,
                                          validator: (val) =>
                                              EmailValidator.validate(val)
                                                  ? null
                                                  : "Please enter a valid email",
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        AppButton(
                                          title: 'Next',
                                          onPress: () {
                                            widget.signUpModel.email = _name.text.trim();

                                            if (_namekey.currentState
                                                .validate()) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignUpPassword(
                                                            signUpModel: widget
                                                                .signUpModel,
                                                          )));
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
