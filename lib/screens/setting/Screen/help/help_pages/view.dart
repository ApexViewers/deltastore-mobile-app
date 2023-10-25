
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/screens/setting/Screen/help/help_pages/terms_conditions.dart';

import '../../../../../constant/styles/app_textstyles.dart';
import '../../../../../constant/styles/colors.dart';
import '../../../../about/view/about_screen.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: cBlack,)),
        backgroundColor: colorWhite,
        title: Text("help",style: hsmall.copyWith(fontSize: 19,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          ListTile(
            trailing: const Icon(Icons.arrow_forward),
            title: Text("FAQ",style: hMedium.copyWith(color: cBlack,fontSize: 15),),

          ),
          const Divider(),
          ListTile(
            onTap: (){
              Get.to(()=>const TermAndConditions());
            },
            trailing: const Icon(Icons.arrow_forward),
            title: Text("Terms and Conditions",style: hMedium.copyWith(color: cBlack,fontSize: 15),),

          ),
          const Divider(),
          ListTile(
            onTap: (){
              Get.to(()=>const AboutScreen());
            },
            trailing: const Icon(Icons.arrow_forward),
            title: Text("About us",style: hMedium.copyWith(color: cBlack,fontSize: 15),),

          ),
          const Divider(),



        ],
      ),
    );
  }
}
