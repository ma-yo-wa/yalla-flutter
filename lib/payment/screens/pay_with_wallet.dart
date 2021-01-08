import 'package:flutter/material.dart';
import 'package:flutter_application_1/account/services/account_services.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/components/success_booking.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/payment/screens/fund_account.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/services/trip_services.dart';

class PayWithWallet extends StatefulWidget {
  final TripModel tripModel;

  PayWithWallet({this.tripModel});

  @override
  _PayWithWalletState createState() => _PayWithWalletState();
}

class _PayWithWalletState extends State<PayWithWallet> {

  int balance = 0;
  bool loader = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AccountServices().getUserDetails().then((res){
      setState(() {
        balance = res.balance;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('$balance');

    return PageLayout(
        title: 'Pay With Wallet',
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.topLeft,
                child: Text(
                  'Make payment from your wallet',
                  style: textStyleDMSan.copyWith(
                      color: Color(0xff878A89), fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Wallet balance',
                        style: textStyleDMSan.copyWith(
                            color: Color(0xff878A89), fontSize: 16)),
                    Text('N${display(balance)}',
                        style: textStyleDMSan.copyWith(
                          color: balance < widget.tripModel.totalPackageAmount ? Colors.red : Colors.black,
                            fontWeight: FontWeight.bold, fontSize: 16))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Package Cost',
                        style: textStyleDMSan.copyWith(
                            color: Color(0xff878A89), fontSize: 16)),
                    Text('N${display(widget.tripModel.totalPackageAmount)}',
                        style: textStyleDMSan.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16))
                  ],
                ),
              ),
              SizedBox(height: 60,),
              balance > widget.tripModel.totalPackageAmount ?
              AppButton(
                title: 'Make Payment',
                loading: loader,
                onPress: () async {
                  setState(() {
                    loader = true;
                  });
                  var response = await TripServices().makeBookingWithWallet(widget.tripModel);
                  setState(() {
                    loader = false;
                  });
                  if(response == null) {
                    return null;
                  }

                  return nextPage(context, (context) => BookingSuccess());
                },
              ) :  AppButton(
                title: 'Fund Wallet',
                onPress: () {
                  nextPage(context, (context) => FundAccount());
                },
              ),
            ],
          ),
        ));
  }
}
