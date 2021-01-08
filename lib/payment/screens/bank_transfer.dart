import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';

class BankTransfer extends StatefulWidget {
  final int fund;

  BankTransfer({this.fund = 0});

  @override
  _BankTransferState createState() => _BankTransferState();
}

class _BankTransferState extends State<BankTransfer> {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: 'Bank Transfer',
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Container(
                alignment: Alignment.center,
                  child: Text('Payment Instruction for Bank Transfer')),
              Container(
                color: Color(0xffF7F7F7),
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transfer N${display(widget.fund)} to',
                      style: textStyleDMSan.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.only(left: 50),
                      child:   Row(
                        children: [
                          Text('Jaiz Bank\nYalla Travel Ltd\n0536097685'),
                          SizedBox(width: 50,),
                          GestureDetector(
                            onTap: (){
                              Clipboard.setData(ClipboardData(text: 'Jaiz Bank Yalla Travel Ltd 0536097685'));
                            },
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Icon(Icons.copy),
                                  Text('Copy')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      '- A charge of N100 (charge amount) would be levied on the incoming amount by the payment processor so you would receive N499,900',
                      style: textStyleDMSan.copyWith(fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
