import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/color.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/screens/select_travel_dates.dart';
import 'package:flutter_application_1/trip/services/trip_services.dart';

class PackageDetails extends StatefulWidget {
  final TripModel tripModel;
  final String packageType;

  PackageDetails({this.tripModel, this.packageType});

  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '${widget.packageType} Package',
        child: Container(
          child: FutureBuilder(
            future: TripServices().getADeal(widget.tripModel.dealPackageId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                padding:
                    EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'STARTING PRICE',
                            style: textStyleDMSan.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'NGN${display(snapshot.data.amount)}',
                            style: textStyleDMSan.copyWith(
                                fontSize: 16,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'BASIC DETAILS',
                      style: textStyleDMSan.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 190,
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: [
                          renderIcon('5star\nHotel', 'architecture'),
                          renderIcon('Breakfast\nOnly', 'cutlery'),
                          renderIcon('From 4\nin a room', 'bed'),
                          renderIcon('Flight', 'transport'),
                          renderIcon('Tent B+', 'camping'),
                        ],
                      ),
                    ),
                    Text(
                      'OTHER DETAILS',
                      style: textStyleDMSan.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    renderText('Three (3) nights in the Oberoi Hotel Madinah'),
                    renderText(
                        'Ten (10) nights in Dar Al Tawhid Hotel, Makkah'),
                    renderText("A Plus Tent in Minaa and 'Arafah"),
                    renderText('Hadaya (Sacrificial ram)'),
                    renderText('Hajj Visa'),
                    renderText(
                        'Local flight/Haramain high-speed train\nto Makkah from Madinah'),
                    renderText('Free customised Hajj and Umrah Rites book'),
                    renderText(
                        'Economy class return ticket on Emirates Airline'),
                    renderText(
                        'Free 5-litre Zam-zam upon return (must\nbe collected within a month from the\ndate of return)'),
                    AppButton(
                      title: 'Select Plan',
                      onPress: () {
                        widget.tripModel.totalPackageAmount =
                            snapshot.data.amount;
                        widget.tripModel.breakFastIncluded =
                            snapshot?.data?.hotelAmenities?.isBreakFastIncluded;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TravelDates(
                                  title: widget.packageType,
                                  tripModel: widget.tripModel,
                                )));
                      },
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }

  Widget renderIcon(title, path) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage('assets/images/$path.png')),
          Text(
            '$title',
            style: textStyleDMSan.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget renderText(text) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 10,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '$text',
            style: textStyleDMSan.copyWith(fontSize: 15),
          )
        ],
      ),
    );
  }
}
