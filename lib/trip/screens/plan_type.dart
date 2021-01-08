import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/screens/package_selection.dart';

class PlanType extends StatefulWidget {
  final TripModel tripModel;
  PlanType({this.tripModel});

  @override
  _PlanTypeState createState() => _PlanTypeState();
}

class _PlanTypeState extends State<PlanType> {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Choose A plan',
      child: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            GestureDetector(
              onTap: (){
                widget.tripModel.bookingFor = 'Self';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PackageSelection(
                      tripModel: widget.tripModel,
                    )));
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Card(
                  color: Color(0xffBBE0D2),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 170,
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage('assets/images/self_pix.png'),),
                        SizedBox(height: 15,),
                        Text('Book for yourself', style: textStyleDMSan.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        Text('This is a text explainer that needs input from a copy writer', style: textStyleDMSan.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                widget.tripModel.bookingFor = 'Someone';
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PackageSelection(
                      tripModel: widget.tripModel,
                    )));
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Card(
                  color: Color(0xffBBE0D2),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 170,
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage('assets/images/someone_pix.png'),),
                        SizedBox(height: 15,),
                        Text('Book for Someone', style: textStyleDMSan.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),),
                        Text('This is a text explainer that needs input from a copy writer', style: textStyleDMSan.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
