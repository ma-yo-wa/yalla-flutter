import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/text_link.dart';
import 'package:flutter_application_1/helpers/color.dart';
import 'package:flutter_application_1/helpers/util.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> _namekey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
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
                              Container(
                                margin: EdgeInsets.only(top: 30, bottom: 10),
                                child: Text(
                                  'Forgot password',
                                  style: textStyleDMSan.copyWith(
                                      fontSize: 24,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                'Please enter the email you used to register, we will send you a password reset link.?',
                                style: textStyleDMSan.copyWith(
                                    fontSize: 16,
                                    color: textColor,
                                  height: 2
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Form(
                                  key: _namekey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your email',
                                        style: textStyleDMSan.copyWith(fontSize: 18),
                                      ),
                                      SizedBox(height: 10,),
                                      TextFormField(
                                        decoration: textDecoration.copyWith(
                                          hintText: 'Enter your email',
                                          prefixIcon: Icon(Icons.email_outlined),
                                        ),
                                        obscureText: true,
                                        validator: (val) =>
                                        EmailValidator.validate(val)
                                            ? null
                                            : "Please enter a valid email",
                                      ),
                                      SizedBox(
                                        height: 139,
                                      ),
                                      AppButton(
                                        title: 'Next',
                                        onPress: () {
                                          if (_namekey.currentState
                                              .validate()) {
                                            print('success');
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
    );
  }
}
