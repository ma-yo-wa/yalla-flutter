import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/util.dart';

class HowTo extends StatefulWidget {
  @override
  _HowToState createState() => _HowToState();
}

class _HowToState extends State<HowTo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Material(
        child: Container(
          padding: EdgeInsets.all(20),
          width: width,
          color: Color(0xffDBF0EB),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How To',
                style: textStyleDMSan.copyWith(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              howToCard('hajj_rites', 'Hajj Rites',
                  'Tips,information and\nrights of Hajj'),
              howToCard('umurah_rites', 'Umrah Rites',
                  'Tips,information and\nrights of Umrah'),
              howToCard('preparation', 'Preparation Tips',
                  'Essential packing, health\ntips, dua list etc'),
            ],
          ),
        ),
      ),
    );
  }

  Widget howToCard(path, title, description) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/$path.png'),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title',
                      style: textStyleDMSan.copyWith(
                          fontSize: 18,
                          color: Color(0xff1F415B),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$description',
                      style: textStyleDMSan.copyWith(
                          color: Color(0xff878A89), fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
