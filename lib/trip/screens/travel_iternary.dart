import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/screens/book_hotel.dart';

class TravelIternary extends StatefulWidget {
  final TripModel tripModel;

  TravelIternary({this.tripModel});

  @override
  _TravelIternaryState createState() => _TravelIternaryState();
}

class _TravelIternaryState extends State<TravelIternary> {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title:
          'Travel Itenary (${convertTravelDate(widget.tripModel.tripStartDate)} - ${convertTravelDate(widget.tripModel.tripEndDate)})',
      child: Container(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  renderTravel(
                      'Day 1',
                      'Departure from Muritala Muhammad International Airport',
                      '17th April'),
                  renderTravel(
                      'Day 2',
                      'Arival at Madinah Airport\nVisitation to Prophet’s Mosque',
                      '18th April'),
                  renderTravel(
                      'Day 3',
                      'Arival at Madinah Airport\nVisitation to Prophet’s Mosque',
                      '19th April'),
                  renderTravel(
                      'Day 4',
                      'Arival at Madinah Airport\nVisitation to Prophet’s Mosque',
                      '20th April'),
                  renderTravel(
                      'Day 5',
                      'Arival at Madinah Airport\nVisitation to Prophet’s Mosque',
                      '21st April'),
                  AppButton(
                    title: 'Select Date',
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookHotel(
                                tripModel: widget.tripModel,
                              )));
                    },
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderTravel(day, message, date) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$day',
                    style: textStyleDMSan.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text(date,
                    style: textStyleDMSan.copyWith(
                      fontSize: 14,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: width * 0.9,
            child: Text(
              message,
              style: textStyleDMSan.copyWith(
                  fontSize: 14, color: Color(0xff878A89)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
