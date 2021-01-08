import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/util.dart';

class AppButton extends StatefulWidget {
  final String title;
  final Function onPress;
  final bool loading;
  final double width;

  AppButton({this.onPress, this.title, this.loading = false, this.width });

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: widget.width == null ? width * 0.8 : widget.width,
      height: 54,
      decoration: BoxDecoration(
          color: Color(0xff00A568),
          borderRadius: BorderRadius.circular(30)
      ),
      child: RaisedButton(
        color: Color(0xff00A568),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        onPressed: widget.loading ? null : widget.onPress,
        child: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           widget.loading ? Text('Please wait ....', style: textStyleInter.copyWith(
             color: Colors.white
           ),) : Text(widget.title, style: textStyleInter.copyWith(
                fontSize: 16,
                color: Colors.white
            ),),

          ],
        )),
      ),
    );
  }
}
