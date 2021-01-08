import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/screens/select_hotel_room.dart';

class BookHotel extends StatefulWidget {
  final TripModel tripModel;

  BookHotel({this.tripModel});

  @override
  _BookHotelState createState() => _BookHotelState();
}

class _BookHotelState extends State<BookHotel> {
  String selectedRoom = '';

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Book ${widget.tripModel.dealType}',
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text(
                'What type of room would\nyou like to book',
                style: textStyleDMSan.copyWith(
                    fontSize: 22, fontWeight: FontWeight.w500),
              ),
              alignment: Alignment.centerLeft,
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    renderRoomOption('Private', selectedRoom,
                        'You are booking the an entire room for yourself alone. This will affects the cost of your fees'),
                    renderRoomOption('Shared', selectedRoom,
                        'You are open to sharing a room with others. This affects the cost of your fees'),
                  ],
                ),
              ),
            ),
            AppButton(
              title: 'Next',
              onPress: selectedRoom.isEmpty
                  ? null
                  : () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SelectHotelRoom(
                              tripModel: widget.tripModel,
                              roomSelected: selectedRoom)));
                    },
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Widget renderRoomOption(room, condition, message) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRoom = room;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Card(
          elevation: condition != room ? 0 : 5,
          child: Container(
            height: 130,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$room room',
                        style: textStyleDMSan.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: condition == room
                                ? Colors.green
                                : Colors.black),
                      ),
                      condition == room
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
                Text(
                  '$message',
                  style: textStyleDMSan.copyWith(fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
