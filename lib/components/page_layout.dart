import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/util.dart';

class PageLayout extends StatefulWidget {
  final Widget child;
  final String title;
  final key;

  PageLayout({this.key, this.child, this.title});

  @override
  _PageLayoutState createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: widget.key,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '${widget.title}',
            style: textStyleDMSan.copyWith(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: widget.child,
      ),
    );
  }
}
