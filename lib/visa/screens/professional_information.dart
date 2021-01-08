import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/email_input.dart';
import 'package:flutter_application_1/components/input_field.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/visa/screens/next_of_kin_info.dart';

class ProfessionalInformation extends StatefulWidget {
  final TripModel tripModel;

  ProfessionalInformation({this.tripModel});

  @override
  _ProfessionalInformationState createState() =>
      _ProfessionalInformationState();
}

class _ProfessionalInformationState extends State<ProfessionalInformation> {
  GlobalKey<FormState> _professionalDetailKey = GlobalKey<FormState>();

  TextEditingController _placeOfWorkController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _telephoneController = TextEditingController();
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _whatsapNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Travel Details',
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 54),
              child: Text(
                'Professional Information',
                style: textStyleDMSan.copyWith(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
                child: Form(
              key: _professionalDetailKey,
              child: ListView(
                children: [
                  InputField(
                    hintText: 'What\'s the name of your Organisation',
                    title: 'Place of Work',
                    controller: _placeOfWorkController,
                  ),
                  InputField(
                    hintText: 'What is your job role',
                    title: 'Occupation',
                    controller: _occupationController,
                  ),
                  InputField(
                    hintText: 'What\'s your official phone number',
                    title: 'Telephone (Official)',
                    controller: _telephoneController,
                    validator: (val) {
                      if(val.trim().length == 11){
                        return null;
                      }
                      return 'Please enter 11 digits number';
                    },
                  ),
                  EmailInputField(
                    title: 'Email Address',
                    hintText: 'What\'s your email address',
                    controller: _emailAddressController,
                  ),
                  InputField(
                    hintText: 'What\'s your whatsapp number',
                    title: 'Whatsapp Number',
                    controller: _whatsapNumberController,
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
                      if (_professionalDetailKey.currentState.validate()) {
                        widget.tripModel.placeOfWork =
                            _placeOfWorkController.text;
                        widget.tripModel.occupation =
                            _occupationController.text;
                        widget.tripModel.phoneNumber =
                            _telephoneController.text;
                        widget.tripModel.email = _emailAddressController.text;
                        widget.tripModel.whatsappNumber =
                            _whatsapNumberController.text;

                        nextPage(
                            context,
                            (context) => NextOfKinInformation(
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
            ))
          ],
        ),
      ),
    );
  }
}
