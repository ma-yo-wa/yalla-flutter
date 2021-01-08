import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/loading_component.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/services/trip_services.dart';
import 'package:flutter_application_1/visa/screens/personal_details.dart';

class SelectHotelRoom extends StatefulWidget {
  final TripModel tripModel;
  final roomSelected;

  SelectHotelRoom({this.tripModel, this.roomSelected});

  @override
  _SelectHotelRoomState createState() => _SelectHotelRoomState();
}

class _SelectHotelRoomState extends State<SelectHotelRoom> {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Book ${widget.tripModel.dealType}',
      child: Container(
        child: FutureBuilder(
          future: TripServices().getAvailHotel(
              widget.tripModel.dealPackageId, widget.roomSelected),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return PageLoadingComp();
            }

            if (snapshot.data.length == 0) {
              return Center(
                child: Text('No Hotel is available'),
              );
            }

            var hotels = snapshot.data;

            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select hotel room',
                    style: textStyleDMSan.copyWith(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          itemCount: hotels.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  renderHotel(hotels, index),
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget renderHotel(hotels, index) {
    return GestureDetector(
      onTap: () {
        widget.tripModel.totalPackageAmount = hotels[index].packagePrice;
        widget.tripModel.hotelName = hotels[index].hotelName;
        widget.tripModel.roomSize = hotels[index].roomSize;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => VisaPersonalDetails(
                  tripModel: widget.tripModel,
                )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 40),
        decoration:
            BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 200),
              items: hotels[index].imageUrl.map<Widget>((e) {
                return Image.network(
                  e,
                  fit: BoxFit.cover,
                );
              }).toList(),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotels[index].hotelName,
                    style: textStyleDMSan.copyWith(fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('NGN ${display(hotels[index].startingPrice)}',
                              style: textStyleDMSan.copyWith(
                                  fontWeight: FontWeight.bold)),
                          hotels[index].roomType == 'Private'
                              ? Text(
                                  '/night',
                                  style: textStyleDMSan.copyWith(
                                      color: Color(0xff708A81),
                                      fontStyle: FontStyle.italic),
                                )
                              : Text(''),
                          hotels[index].roomType == 'Shared'
                              ? Text(
                                  ' per person',
                                  style: textStyleDMSan.copyWith(
                                      color: Color(0xff708A81),
                                      fontStyle: FontStyle.italic),
                                )
                              : Text(''),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Color(0xffEAEAEA),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text('${hotels[index].roomType} room'),
                      )
                    ],
                  ),
                  hotels[index].roomType == 'Shared'
                      ? Container(
                          child: Row(
                            children: [
                              Icon(Icons.king_bed),
                              SizedBox(
                                width: 10,
                              ),
                              Text(hotels[index].numberOfBeds.toString())
                            ],
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${hotels[index].distanceFromHaram}'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text('Total package'),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'NGN ${display(hotels[index].packagePrice)}',
                          style: textStyleDMSan.copyWith(
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
