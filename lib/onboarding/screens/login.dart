import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard/screens/home_layout.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/text_link.dart';
import 'package:flutter_application_1/helpers/color.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/onboarding/models/login_in_request.dart';
import 'package:flutter_application_1/onboarding/screens/forgot_password.dart';
import 'package:flutter_application_1/onboarding/screens/sign_up_name.dart';
import 'package:flutter_application_1/onboarding/services/sign_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _namekey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool passwordEmpty = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Material(
        child: Container(
          padding: EdgeInsets.only(top: 32, left: 32, right: 32, bottom: 10),
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
                              margin: EdgeInsets.only(top: 30, bottom: 60),
                              child: Text(
                                'Log In',
                                style: textStyleDMSan.copyWith(
                                    fontSize: 24,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              'Your email',
                              style: textStyleDMSan.copyWith(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Form(
                                key: _namekey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller: _emailController,
                                      decoration: textDecoration.copyWith(
                                        hintText: 'Enter your email',
                                        prefixIcon: Icon(Icons.email_outlined),
                                      ),
                                      validator: (val) =>
                                          EmailValidator.validate(val.trim())
                                              ? null
                                              : "Please enter a valid email",
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Your Password',
                                      style:
                                          textStyleDMSan.copyWith(fontSize: 18),
                                    ),
                                    TextFormField(
                                      decoration: textDecoration.copyWith(
                                        hintText: 'Enter a secure password',
                                        prefixIcon: Icon(Icons.lock),
                                      ),
                                      controller: _passwordController,
                                      obscureText: true,
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          setState(() {
                                            passwordEmpty = true;
                                          });
                                          return '';
                                        }

                                        setState(() {
                                          passwordEmpty = false;
                                        });

                                        return null;
                                      },
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Incorrect password',
                                            style: textStyleDMSan.copyWith(
                                                fontSize: 10,
                                                color: passwordEmpty
                                                    ? Colors.red
                                                    : Colors.white),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ForgotPassword()));
                                            },
                                            child: Text(
                                              'Forgot password?',
                                              style: textStyleDMSan.copyWith(
                                                  color: primaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    loading ? SpinKitFadingCircle(
                                      size: 40,
                                      color: Colors.green,
                                    ) :
                                    AppButton(
                                      title: 'Next',
                                      onPress: () async {
                                        LoginRequestModel data =
                                            LoginRequestModel()
                                              ..email = _emailController.text.trim()
                                              ..password =
                                                  _passwordController.text.trim();

                                        if (_namekey.currentState.validate()) {
                                          setState(() {
                                            loading = true;
                                          });
                                          var response = await SignUpServices()
                                              .login(data.toJson());
                                          setState(() {
                                            loading = false;
                                          });

                                          if(response == null) {
                                            return null;
                                          }

                                          if (response.idToken.isNotEmpty) {
                                            return Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeLayout()));
                                          }

                                        }
                                      },
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpName()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'A new user? Sign Up',
                            style: textStyleDMSan.copyWith(
                                fontSize: 18, color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
