import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/util.dart';

class DropdownField extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function onChange;
  final String initValue;

  DropdownField({this.title, this.items, this.onChange, this.initValue});

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: textStyleDMSan.copyWith(
              fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 5,),
          Container(
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Color(0xffF2F3F5))),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    fillColor: Color(0xffF2F3F5),
                      filled: true,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF2F3F5)))),
                  items: widget.items.map((e){
                    return getDropdownMenu(e);
                  }).toList(),
                  value: widget.initValue,
                  validator: (val) {
                    if(val == widget.initValue){
                      return 'This is required';
                    }
                    return null;
                  },
                  onChanged: widget.onChange,
                  isExpanded: true,
                 )
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> getDropdownMenu(e){
    return DropdownMenuItem(
      child: Text(e),
      value: e,
    );
  }
}
