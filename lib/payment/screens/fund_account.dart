import 'package:flutter/material.dart';
import 'package:flutter_application_1/account/services/account_services.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/dashboard/screens/home_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/payment/screens/bank_transfer.dart';
import 'package:flutter_application_1/payment/services/payment_services.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';

class FundAccount extends StatefulWidget {
  @override
  _FundAccountState createState() => _FundAccountState();
}

class _FundAccountState extends State<FundAccount> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int fund = 0;
  // Holds the text that user typed.
  String text = '';

  String email = '';

  // True if shift enabled.
  bool shiftEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AccountServices().getUserDetails().then((res){
      setState(() {
        email = res.email;
      });
    });
    PaystackPlugin.initialize(publicKey: publicKey);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Fund Account'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
        height: height,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text(
                'Enter the amount you\nwant to fund',
                textAlign: TextAlign.center,
                style: textStyleDMSan.copyWith(
                    fontSize: 18, color: Color(0xff1F415B)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('N'),
                  Text('${fund != 0 ? display(fund) : '0.00'}',
                      style: textStyleDMSan.copyWith(
                          fontSize: 48, color: Color(0xff1F415B)))
                ],
              ),
            ),
            VirtualKeyboard(
                type: VirtualKeyboardType.Numeric,
                fontSize: 20,
                onKeyPress: _onKeyPress),
            SizedBox(
              height: 40,
            ),
            AppButton(
              title: 'Next',
              onPress: fund < 1
                  ? null
                  : () {
                      // scaffoldKey.currentState
                      //     .showBottomSheet((context) => showBottomMenu());
                showBottomMenu();
                    },
            ),
          ],
        ),
      ),
    );
  }

  _onKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.String) {
      text = text + (shiftEnabled ? key.capsText : key.text);
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (text.length == 0) return;
          text = text.substring(0, text.length - 1);
          break;
        case VirtualKeyboardKeyAction.Return:
          text = text + '\n';
          break;
        case VirtualKeyboardKeyAction.Space:
          text = text + key.text;
          break;
        case VirtualKeyboardKeyAction.Shift:
          shiftEnabled = !shiftEnabled;
          break;
        default:
      }
    }

    if (text.isEmpty) {
      return setState(() {
        fund = 0;
      });
    }
    setState(() {
      fund = int.parse(text);
    });
  }

  showBottomMenu() {

    return showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async{
                    Charge charge = Charge()
                      ..amount = fund * 100
                      ..reference = '${DateTime.now().millisecondsSinceEpoch.toString()}'
                      ..email = email;
                    try {
                      CheckoutResponse response = await PaystackPlugin.checkout(
                        context,
                        method:
                        CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
                        charge: charge,
                      );

                      if(!response.status){
                        return pageToast(response.message,  Colors.red);
                      }

                      if(response.status){
                        print(response);

                        var res = await PaymentServices().fundAccount({
                          "amount": fund,
                          "payment_reference": response.reference,
                          "payment_status": response.status.toString(),
                          "gateway_response": 'Approved By Financial Institution'
                        });

                        if(res == null){
                          return null;
                        }

                        return nextPage(context, (context) => HomeLayout());
                      }
                    } catch (e) {}
                  },
                  child: Card(
                    elevation: 1,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Icon(Icons.wallet_giftcard), SizedBox(width: 5,), Text('Debit Card')],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    nextPage(context, (context) => BankTransfer(fund: fund,));
                  },
                  child: Card(
                    elevation: 1,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Image(image: AssetImage('assets/images/building.png')), SizedBox(width: 5,), Text('Bank Transfer')],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
