import 'package:flutter/material.dart';
import 'package:flutter_application_1/account/services/account_services.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/components/success_booking.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/payment/screens/pay_with_wallet.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/services/trip_services.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class TripSummary extends StatefulWidget {
  final TripModel tripModel;

  TripSummary({this.tripModel});

  @override
  _TripSummaryState createState() => _TripSummaryState();
}

class _TripSummaryState extends State<TripSummary> {
  String email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AccountServices().getUserDetails().then((res) {
      setState(() {
        email = res.email;
      });
    });
    PaystackPlugin.initialize(publicKey: publicKey);
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '${widget.tripModel.package} Package',
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Summary',
                  style: textStyleDMSan.copyWith(
                      fontSize: 24,
                      color: Color(0xff00A568),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Text(
                        widget.tripModel.package,
                        style: textStyleDMSan.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      renderSummary('Date',
                          '${convertTravelDate(widget.tripModel.tripStartDate)} - ${convertTravelDate(widget.tripModel.tripEndDate)}'),
                      renderSummary('Hotel', widget.tripModel.hotelName),
                      widget.tripModel.breakFastIncluded
                          ? renderSummary('Feeding', 'Breakfast only')
                          : Container(),
                      renderSummary('Room Size', widget.tripModel.roomSize),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(top: 26),
                        color: Color(0xffF4F5F6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TOTAL',
                              style: textStyleDMSan.copyWith(fontSize: 16),
                            ),
                            Text(
                              'NGN ${display(widget.tripModel.totalPackageAmount)}',
                              style: textStyleDMSan.copyWith(
                                  fontSize: 20, color: Color(0xff00A516)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        alignment: Alignment.center,
                        child: Text(
                          'PAYMENT OPTIONS',
                          style: textStyleDMSan.copyWith(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pay with bank card\nor make a transfer',
                              style: textStyleDMSan.copyWith(
                                  fontSize: 14, color: Color(0xff878A89)),
                            ),
                            AppButton(
                              title: 'Pay Now',
                              onPress: () async {
                                Charge charge = Charge()
                                  ..amount = widget.tripModel.totalPackageAmount
                                          .toInt() *
                                      100
                                  ..reference =
                                      '${DateTime.now().millisecondsSinceEpoch.toString()}'
                                  ..email = email;
                                try {
                                  CheckoutResponse response =
                                      await PaystackPlugin.checkout(
                                    context,
                                    method: CheckoutMethod
                                        .card, // Defaults to CheckoutMethod.selectable
                                    charge: charge,
                                  );

                                  if (!response.status) {
                                    return pageToast(
                                        response.message, Colors.red);
                                  }

                                  if (response.status) {
                                    widget.tripModel.paymentReference = response.reference;
                                    widget.tripModel.paymentStatus = response.status.toString();


                                    var res = await TripServices()
                                        .makeBooking(widget.tripModel);

                                    print('*****$res');

                                    if (res == null) {
                                      return null;
                                    }

                                    return nextPage(
                                        context,
                                        (context) => BookingSuccess(
                                              tripModel: widget.tripModel,
                                            ));
                                  }
                                } catch (e) {}
                              },
                              width: 150,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'You have',
                                    style: textStyleDMSan.copyWith(
                                        fontSize: 14, color: Color(0xff878A89)),
                                  ),
                                  Text(
                                    'N5,300,000',
                                    style: textStyleDMSan.copyWith(
                                        fontSize: 14,
                                        color: Color(0xff878A89),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'in your wallet',
                                    style: textStyleDMSan.copyWith(
                                        fontSize: 14, color: Color(0xff878A89)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: Color(0xff00A568), width: 3)),
                              child: RaisedButton(
                                onPressed: () {
                                  nextPage(
                                      context,
                                      (context) => PayWithWallet(
                                          tripModel: widget.tripModel));
                                },
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Pay with Wallet',
                                    style: textStyleDMSan.copyWith(
                                        color: Color(0xff00A568),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pay in bits and save\nup to this amount',
                              style: textStyleDMSan.copyWith(
                                  fontSize: 14, color: Color(0xff878A89)),
                            ),
                            Container(
                              width: 150,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: Color(0xff00A568), width: 3)),
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Start Saving',
                                    style: textStyleDMSan.copyWith(
                                        color: Color(0xff00A568),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget renderSummary(title, value) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textStyleDMSan.copyWith(fontSize: 16),
          ),
          Text(
            value,
            style: textStyleDMSan.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
