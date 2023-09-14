import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/constant/paddings.dart';
import 'package:test_app/constant/styles/app_textstyles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/image_assets.dart';
import '../../constant/spacing.dart';
import '../../constant/styles/colors.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    var faceBook="https://www.facebook.com/confirmemail.php?next=https%3A%2F%2Fwww.facebook.com%2Fdeltastore.ae%2F";
    var instragram="https://www.instagram.com/deltastore.ae/";
    var youtube="https://www.youtube.com/@deltastoreae";
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: cBlack,
            )),
        elevation: 0,
        backgroundColor: colorWhite,
        title: Container(
          width: 60.w,
          child: Image.asset(
            ImageAssests.logoImge.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: Padding(
        padding: padA1,
        child: Column(
          children: [
            vSpac6,
            Text(
              "Contact Info",
              style: hMediumX.copyWith(color: cBlack, fontSize: 19),
            ),
            vSpac6,
            Row(
              children: [Text("Location :",style: hMediumX.copyWith(color: cBlack,fontSize: 18),)],
            ),
          Text(
                "Delta International Trading – Showroom no1 Al Nabooda Building, Second Industrial St,Street No 2 – Industrial Area 6 – Sharjah, UAE.",style: hsmall,),
            vSpac6,
            Row(
              children: [Text("Email:",style: hMediumX.copyWith(fontSize: 14),), Text("Info@ditllcae.com", style: hsmall,)],
            ),
            vSpac6,
          Row(
              children: [Text("Check our Social Links",style: hsmall,)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                InkWell(
                  onTap: (){
                    launch(faceBook);
                  },

                    child: Icon(Icons.facebook,size: 54,)),
                InkWell(
                  onTap: (){
                    launch(youtube);
                  },
                  child: Container(height: 45,
                    width: 45,

                    child: Image.asset(
                      ImageAssests.youtube
                      ,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    launch(instragram);
                  },
                  child: Container(height: 45,
                    width: 45,

                    child: Image.asset(
                      ImageAssests.instragram
                      ,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
