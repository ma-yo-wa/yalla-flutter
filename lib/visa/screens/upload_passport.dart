import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/screens/trip_summary_list.dart';
import 'package:flutter_application_1/visa/screens/visa_success.dart';
import 'package:flutter_application_1/visa/services/visa_services.dart';
import 'package:image_picker/image_picker.dart';

class UploadPassport extends StatefulWidget {
  final TripModel tripModel;

  UploadPassport({this.tripModel});

  @override
  _UploadPassportState createState() => _UploadPassportState();
}

class _UploadPassportState extends State<UploadPassport> {
  File _image;
  var _imagePath;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return PageLayout(
      title: 'Travel details',
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                  'Upload your Passport',
                  style: textStyleDMSan.copyWith(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              Text('Upload the data page of your\ninternational passport', style: textStyleDMSan.copyWith(
                fontSize: 18,
                color: Color(0xff1F415B)
              ),),
              Expanded(child: Container(
                child: ListView(
                  children: [
                    _image == null ?
                    Container(
                      height: 101,
                      color: Color(0xffF2F3F5),
                      margin: EdgeInsets.only(top: 20),
                      child: Image(
                        image: AssetImage('assets/images/passport_icon.png'),
                      ),
                    ) : Container(
                  width: width,
                  height: 100.0,
                  child: Image.file(_image)),
                    SizedBox(height: 30),
                    Container(
                      height: 54,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff00A568),
                          borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Color(0xff00A568),
                          width: 2
                        )
                      ),
                      child: RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                        ),
                          onPressed: () async {
                            final imagePicked = await ImagePicker()
                                .getImage(source: ImageSource.gallery);
                            setState(() {
                              _image = File(imagePicked.path);
                              _imagePath = imagePicked;
                            });
                          },
                        child: Center(
                          child: Text('Upload', style: textStyleDMSan.copyWith(
                            color: Color(0xff00A568),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),),
                        ),
                          ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Example:', style: textStyleDMSan.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),),
                          Text('Upload this page from your\ninternational passport', style: textStyleDMSan.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          )),
                          SizedBox(height: 20,),
                          Image(image: AssetImage('assets/images/passport_img.png')),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    widget.tripModel.dealType != null ?
                    AppButton(
                      title: 'Next',
                      onPress: _image == null ? null : (){
                        widget.tripModel.passportDataPage = _imagePath;
                        nextPage(context, (context) => TripSummary(tripModel: widget.tripModel,));
                      },
                    ) :  AppButton(
                      title: 'Submit Application',
                      onPress: _image == null ? null : () async {
                        widget.tripModel.passportDataPage = _imagePath;
                        var response = await VisaServices().submitVisaApplication(widget.tripModel);

                        if(response == null){
                          return null;
                        }

                        return nextPage(context, (context) => VisaApplicationSuccess());
                      },
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
