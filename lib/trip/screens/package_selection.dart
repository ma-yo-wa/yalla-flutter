import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/page_layout.dart';
import 'package:flutter_application_1/helpers/util.dart';
import 'package:flutter_application_1/trip/models/trip_model.dart';
import 'package:flutter_application_1/trip/screens/package_details.dart';
import 'package:flutter_application_1/trip/services/trip_services.dart';

class PackageSelection extends StatefulWidget {
  final TripModel tripModel;

  PackageSelection({this.tripModel});

  @override
  _PackageSelectionState createState() => _PackageSelectionState();
}

class _PackageSelectionState extends State<PackageSelection> {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
        title: '${widget.tripModel.dealType} Plans',
        child: FutureBuilder(
          future: TripServices().getDealTypes(widget.tripModel.dealType),
          builder: (BuildContext context, AsyncSnapshot snapShop) {
            if (snapShop.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapShop.hasData) {
              return ListView.builder(
                  itemCount: snapShop.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () async {
                              widget.tripModel.dealPackageId =
                                  snapShop.data[index].id;
                              widget.tripModel.package =
                                  snapShop.data[index].name;

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PackageDetails(
                                      tripModel: widget.tripModel,
                                      packageType: snapShop.data[index].name)));
                            },
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                            leading: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                    width: 50,
                                    height: 60,
                                    child: Icon(
                                      Icons.backpack,
                                      color: Color(int.parse(
                                          '0xff${snapShop.data[index].color}')),
                                    ))),
                            title: Text(
                              '${snapShop.data[index].name} Package',
                              style: textStyleDMSan.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            subtitle: Text(
                              'From: NGN ${display(snapShop.data[index].amount)}',
                              style: textStyleDMSan.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          )
                        ],
                      ),
                    );
                  });
            }

            return Center(child: Text('Check network'));
          },
        ));
  }
}
