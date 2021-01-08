import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard/screens/home_layout.dart';
import 'package:flutter_application_1/components/SignUpContainer.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/text_link.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/onboarding/models/sign_up_model.dart';
import 'package:flutter_application_1/onboarding/services/sign_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignUpPassword extends StatefulWidget {
  final SignUpModel signUpModel;

  SignUpPassword({this.signUpModel});

  @override
  _SignUpPasswordState createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends State<SignUpPassword> {
  GlobalKey<FormState> _namekey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  bool loading = false;

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
                                  'Create a password?',
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
                                            hintText: 'Enter a secure password',
                                            prefixIcon: Icon(Icons.lock),
                                          ),
                                          controller: _name,
                                          obscureText: true,
                                          validator: (val) {
                                            if (val.isEmpty) {
                                              return 'Please enter a secure password';
                                            }

                                            return null;
                                          },
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
                                            widget.signUpModel.password =
                                                _name.text.trim();
                                            if (_namekey.currentState
                                                .validate()) {
                                              setState(() {
                                                loading = true;
                                              });
                                              var response =
                                                  await SignUpServices().signUp(
                                                      widget.signUpModel
                                                          .toJson());
                                              setState(() {
                                                loading = false;
                                              });

                                              if(response != null){
                                                return Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeLayout()));
                                              }

                                              return pageToast('Please check your credentials', Colors.red);
                                              // print(response);
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
