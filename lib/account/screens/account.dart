import 'package:flutter/material.dart';
import 'package:flutter_application_1/account/services/account_services.dart';
import 'package:flutter_application_1/components/loading_component.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/onboarding/services/sign_services.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String email = '';
  String name = '';
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading = true;
    });
    AccountServices().getDetails().then((res){
      setState(() {
        email = res['email'];
        name = res['name'];
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double textSize = 18;
    return loading ? PageLoadingComp() : Container(
      padding: EdgeInsets.only(left: 20, top: 40, right: 20),
      child: ListView(
        children: [
          Text('Account', style: textStyleDMSan.copyWith(
            fontSize: 24
          ),),
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 25),
            child: Row(
              children: [
                Image(image: AssetImage('assets/images/avatar.png')),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$name', style: textStyleDMSan.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    Text('$email')
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(Icons.person, size: 30,),
                    SizedBox(width: 10,),
                    Text('Personal Information', style: textStyleDMSan.copyWith(
                      fontSize: textSize
                    ),)
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios_outlined, size: 20,), onPressed: (){})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/images/banks.png'),),
                    SizedBox(width: 10,),
                    Text('Bank & Cards', style: textStyleDMSan.copyWith(
                        fontSize: textSize
                    ),)
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios_outlined, size: 20,), onPressed: (){})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(Icons.notification_important, size: 30,),
                    SizedBox(width: 10,),
                    Text('Push Notifications', style: textStyleDMSan.copyWith(
                        fontSize: textSize
                    ),)
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios_outlined, size: 20,), onPressed: (){})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/images/help.png'),),
                    SizedBox(width: 10,),
                    Text('Help and Information', style: textStyleDMSan.copyWith(
                        fontSize: textSize
                    ),)
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios_outlined, size: 20,), onPressed: (){})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/images/about.png'),),
                    SizedBox(width: 10,),
                    Text('About Us', style: textStyleDMSan.copyWith(
                        fontSize: textSize
                    ),)
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios_outlined, size: 20,), onPressed: (){})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(Icons.lock, size: 30,),
                    SizedBox(width: 10,),
                    Text('Privacy Policy', style: textStyleDMSan.copyWith(
                        fontSize: textSize
                    ),)
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios_outlined, size: 20,), onPressed: (){})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/images/oath.png'),),
                    SizedBox(width: 10,),
                    Text('Legal', style: textStyleDMSan.copyWith(
                        fontSize: textSize
                    ),)
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios_outlined, size: 20,), onPressed: (){})
            ],
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () async{
              await SignUpServices().logout();
              Navigator.of(context).popUntil((route) => route.settings.name == '/');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/images/log_out.png'),),
                      SizedBox(width: 10,),
                      Text('Log Out', style: textStyleDMSan.copyWith(
                          fontSize: textSize,
                        color: Colors.red
                      ),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
