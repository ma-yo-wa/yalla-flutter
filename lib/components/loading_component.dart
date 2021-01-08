import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class PageLoadingComp extends StatefulWidget {

  PageLoadingComp();

  @override
  _PageLoadingCompState createState() => _PageLoadingCompState();
}

class _PageLoadingCompState extends State<PageLoadingComp> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SkeletonAnimation(
        child: Column(
          children: [
            Container(
              height: 200,
              width: width,
              color: Color(0xffBBE0D2),
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              width: width,
              color: Color(0xffBBE0D2),
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              width: width,
              color: Color(0xffBBE0D2),
            ),
          ],
        ));;
  }
}
