import 'package:flutter/material.dart';
import 'package:flutter_application_1/account/services/account_services.dart';
import 'package:flutter_application_1/helpers/color.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/payment/screens/fund_account.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/screens/plan_type.dart';
import 'package:flutter_application_1/visa/screens/personal_details.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TripModel tripModel = TripModel();

  int balance = 0;
  bool loader = false;
  String name = 'User';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AccountServices().getUserDetails().then((res) {
      setState(() {
        balance = res.balance;
        name = res.name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          Container(
            height: height * 0.2,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/dashboard_bg.png'),
                    fit: BoxFit.fill)),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage('assets/images/avatar.png')),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '$name',
                        style: textStyleDMSan.copyWith(fontSize: 17),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'N${display(balance)}',
                        style: textStyleDMSan.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            nextPage(context, (context) => FundAccount());
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_box,
                                color: primaryColor,
                              ),
                              Text(
                                'Add Funds',
                                style: textStyleDMSan.copyWith(
                                    fontSize: 17, color: primaryColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      tripModel.dealType = 'Hajj';
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlanType(
                                tripModel: tripModel,
                              )));
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 150,
                        decoration: BoxDecoration(
                            color: secondaryColor.withOpacity(0.55),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hajj',
                                    style: textStyleDMSan.copyWith(
                                        fontSize: 30,
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Plan your Hajj trip',
                                    style: textStyleDMSan.copyWith(
                                        fontSize: 18,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            Image(
                              image: AssetImage('assets/images/hajj.png'),
                              width: 100,
                            )
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.only(bottom: 24),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      tripModel.dealType = 'Umurah';

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlanType(
                                tripModel: tripModel,
                              )));
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 150,
                        decoration: BoxDecoration(
                            color: Color(0xff07BCD5).withOpacity(0.55),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Umrah',
                                    style: textStyleDMSan.copyWith(
                                        fontSize: 30,
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Plan your Umrah trip',
                                    style: textStyleDMSan.copyWith(
                                        fontSize: 18,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            Image(
                              image: AssetImage(
                                'assets/images/umurah.png',
                              ),
                              width: 100,
                            )
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.only(bottom: 24),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      nextPage(
                          context,
                          (context) => VisaPersonalDetails(
                                tripModel: tripModel,
                              ));
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 150,
                        decoration: BoxDecoration(
                            color: Color(0xff9FC603).withOpacity(0.55),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Visa',
                                    style: textStyleDMSan.copyWith(
                                        fontSize: 30,
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Get a Pilgrim Visa',
                                    style: textStyleDMSan.copyWith(
                                        fontSize: 18,
                                        color: Color(0xff778A2A),
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            Image(
                              image: AssetImage('assets/images/visa.png'),
                              width: 100,
                            )
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.only(bottom: 24),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
