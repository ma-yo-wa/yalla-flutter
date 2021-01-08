import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/miscelleneous.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/screens/travel_iternary.dart';
import 'package:flutter_application_1/trip/services/trip_services.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class TravelDates extends StatefulWidget {
  final TripModel tripModel;
  final String title;

  TravelDates({this.tripModel, this.title});

  @override
  _TravelDatesState createState() => _TravelDatesState();
}

class _TravelDatesState extends State<TravelDates> {
  MiscellaneousModel miscellaneousModel = MiscellaneousModel();
  String dateSelected = '';

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: widget.title,
      child: Container(
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: TripServices().getTravelDates(widget.tripModel.dealPackageId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'When will you like to travel',
                        style: textStyleDMSan.copyWith(fontSize: 24),
                      ),
                      Icon(Icons.calendar_today_sharp)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: snapshot.data.travelDates.length,
                      itemBuilder: (context, index) {
                        return renderDate(
                            snapshot.data.travelDates[index], dateSelected);
                      },
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget renderDate(date, condition) {
    return GestureDetector(
      onTap: () {
        setState(() {
          dateSelected = date.sId;
        });
        widget.tripModel.tripStartDate = date.startDate;
        widget.tripModel.tripEndDate = date.endDate;
        miscellaneousModel.dateId = date.sId;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TravelIternary(
                  tripModel: widget.tripModel,
                )));
      },
      child: Card(
        elevation: condition != date.sId ? 0 : 5,
        child: Container(
          height: 90,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${convertTravelDate(date.startDate)} - ${convertTravelDate(date.endDate)}',
                      style: textStyleDMSan.copyWith(
                          fontSize: 16,
                          color: condition == date.sId
                              ? Colors.green
                              : Colors.black),
                    ),
                    condition == date.sId
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Text(''),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Batch')
            ],
          ),
        ),
      ),
    );
  }
}
