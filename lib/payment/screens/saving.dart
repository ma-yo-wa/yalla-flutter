import 'package:flutter/material.dart';
import 'package:flutter_application_1/account/services/account_services.dart';
import 'package:flutter_application_1/components/loading_component.dart';
import 'package:flutter_application_1/helpers/color.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/payment/models/payment_history.dart';
import 'package:flutter_application_1/payment/services/payment_services.dart';
import 'package:intl/intl.dart';

class Savings extends StatefulWidget {
  @override
  _SavingsState createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  int balance = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AccountServices().getUserDetails().then((res) {
      setState(() {
        balance = res.balance;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Material(
        child: FutureBuilder(
          future: PaymentServices().getPaymentHistory(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return PageLoadingComp();
            }

            return Container(
              color: Color(0xffF5FAFA),
              width: width,
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Savings',
                    style: textStyleDMSan.copyWith(
                        fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 17, top: 26, bottom: 26, right: 17),
                    width: width,
                    decoration: BoxDecoration(
                        color: Color(0xff156863),
                        borderRadius: BorderRadius.circular(13)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MY SAVINGS',
                              style:
                                  textStyleDMSan.copyWith(color: Color(0xffB3E2DF)),
                            ),
                            Text(
                              'N${display(balance)}',
                              style: textStyleDMSan.copyWith(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 34,
                              width: 58,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xff07413D)),
                              child: Text(
                                'Add',
                                style: textStyleDMSan.copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Image(image: AssetImage('assets/images/kaaba.png'))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 37,
                  ),
                  Text(
                    'ACTIVITY',
                    style: textStyleDMSan.copyWith(
                        fontSize: 14,
                        color: textColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  snapshot.data.length > 0
                      ? Expanded(
                          child: Container(
                            width: width,
                            child: ListView(
                              children: snapshot.data.map<Widget>((e) => renderActivity(e)).toList(),
                            ),
                          ),
                        )
                      : Container(
                          child: Center(
                            child: Text('No Activity Available'),
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

  Widget renderActivity(PaymentHistoryModel e) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Color(0xff787878),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Color(0xffD4D5D6))),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top up funds',
                      style: textStyleDMSan.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    Text(
                      '${convertPaymentHistory(e.transactionDate)}',
                      style: textStyleDMSan.copyWith(
                          fontSize: 14, color: Color(0xff878A89)),
                    ),
                  ],
                )
              ],
            ),
          ),
          Text('N${display(e.amount)}',
              style: textStyleDMSan.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
