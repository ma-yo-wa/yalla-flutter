import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/dropdown_fields.dart';
import 'package:flutter_application_1/components/email_input.dart';
import 'package:flutter_application_1/components/input_field.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/visa/screens/upload_passport.dart';

class NextOfKinInformation extends StatefulWidget {
  final TripModel tripModel;

  NextOfKinInformation({this.tripModel});

  @override
  _NextOfKinInformationState createState() => _NextOfKinInformationState();
}

class _NextOfKinInformationState extends State<NextOfKinInformation> {
  GlobalKey<FormState> _nextOfKinKey = GlobalKey<FormState>();
  String relationship;

  TextEditingController _nameNextController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telephoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: 'Travel details',
        child: Container(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 54),
                  child: Text(
                    'Next of Kin Information',
                    style: textStyleDMSan.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                    child: Form(
                  key: _nextOfKinKey,
                  child: Container(
                    child: ListView(
                      children: [
                        InputField(
                          title: 'Name (of your next of kin)',
                          controller: _nameNextController,
                          hintText: 'What\'s the name of your next of kin',
                        ),
                        DropdownField(
                          title: 'Relationship',
                          items: [
                            'Select your relationship type',
                            'Sibling',
                            'Spouse',
                            'Friend',
                            'Parent',
                            'Guardian'
                          ],
                          initValue: 'Select your relationship type',
                          onChange: (val) {
                            setState(() {
                              relationship = val;
                            });
                          },
                        ),
                        InputField(
                          title: 'Address (of your next of kin)',
                          controller: _addressController,
                          hintText: 'Enter their address',
                        ),
                        EmailInputField(
                          title: 'Email address (of your next of kin)',
                          controller: _emailController,
                          hintText: 'What\'s their email address',
                        ),
                        InputField(
                          title: 'Telephone (of your next of kin)',
                          controller: _telephoneController,
                          hintText: 'What\'s their whatsap',
                          validator: (val) {
                            if(val.trim().length == 11){
                              return null;
                            }
                            return 'Please enter 11 digits number';
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppButton(
                          title: 'Next',
                          onPress: () {
                            if (_nextOfKinKey.currentState.validate()) {
                              widget.tripModel.nextOfKinName =
                                  _nameNextController.text;
                              widget.tripModel.relationshipWithNextOfKin =
                                  relationship;
                              widget.tripModel.nextOfKinAddress =
                                  _addressController.text;
                              widget.tripModel.nextOfKinEmail =
                                  _emailController.text;
                              widget.tripModel.nextOfKinPhoneNumber =
                                  _telephoneController.text;

                              nextPage(
                                  context,
                                  (context) => UploadPassport(
                                        tripModel: widget.tripModel,
                                      ));
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
