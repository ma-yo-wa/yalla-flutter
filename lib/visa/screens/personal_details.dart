import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/dropdown_fields.dart';
import 'package:flutter_application_1/components/input_field.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/mock.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/visa/screens/professional_information.dart';

class VisaPersonalDetails extends StatefulWidget {
  final TripModel tripModel;

  VisaPersonalDetails({this.tripModel});

  @override
  _VisaPersonalDetailsState createState() => _VisaPersonalDetailsState();
}

class _VisaPersonalDetailsState extends State<VisaPersonalDetails> {
  GlobalKey<FormState> _personalDetailKey = GlobalKey<FormState>();
  String selectedSex = 'Male';
  String nationality = '';
  String stateOfOrigin = '';
  String maritalStatus = '';

  TextEditingController _surnameController = TextEditingController();
  TextEditingController _givenNameController = TextEditingController();
  TextEditingController _passportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Travel details',
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 38, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 54),
              child: Text(
                'Personal Information',
                style: textStyleDMSan.copyWith(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
                child: Form(
              key: _personalDetailKey,
              child: Container(
                child: ListView(
                  children: [
                    InputField(
                      title: 'Surname',
                      controller: _surnameController,
                      hintText: 'What\'s your surname',
                    ),
                    InputField(
                      title: 'Given Name',
                      controller: _givenNameController,
                      hintText: 'What\'s your first name',
                    ),
                    InputField(
                      title: 'Passport',
                      controller: _passportController,
                      hintText: 'Enter your passport number',
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Gender', style: textStyleDMSan.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(value: 'Male', groupValue: selectedSex, onChanged: (val){
                                      setState(() {
                                        selectedSex = val;
                                      });
                                    }),
                                    Text('Male')
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Radio(value: 'Female', groupValue: selectedSex, onChanged: (val){
                                      setState(() {
                                        selectedSex = val;
                                      });
                                    }),
                                    Text('Female')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    DropdownField(
                      title: 'Nationality',
                      items: ['Select your nationality', 'Nigerian'],
                      onChange: (val) {
                        setState(() {
                          nationality = val;
                        });
                      },
                      initValue: 'Select your nationality',
                    ),
                    DropdownField(
                      title: 'State of Origin',
                      items: state.toList(),
                      onChange: (val) {
                        setState(() {
                          stateOfOrigin = val;
                        });
                      },
                      initValue: 'Select your state of Origin',
                    ),
                    DropdownField(
                      title: 'Marital Status',
                      items: [
                        'Select your marital status',
                        'Single',
                        'Married',
                        'Divorced',
                        'Widow'
                      ],
                      onChange: (val) {
                        setState(() {
                          maritalStatus = val;
                        });
                      },
                      initValue: 'Select your marital status',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppButton(
                      title: 'Next',
                      onPress: (){
                        if(_personalDetailKey.currentState.validate()){
                          widget.tripModel.surname = _surnameController.text;
                          widget.tripModel.givenName = _givenNameController.text;
                          widget.tripModel.passportNumber = _passportController.text;
                          widget.tripModel.gender = selectedSex;
                          widget.tripModel.nationality = nationality;
                          widget.tripModel.stateOfOrigin = stateOfOrigin;
                          widget.tripModel.maritalStatus = maritalStatus;
                          nextPage(context, (context) => ProfessionalInformation(tripModel: widget.tripModel,));
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
    );
  }
}
