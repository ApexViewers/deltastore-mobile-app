
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../constant/paddings.dart';
import '../constant/styles/app_textstyles.dart';
import '../constant/styles/colors.dart';
import '../reuseable_widgets/appbar_widget.dart';
import '../reuseable_widgets/rounded_button.dart';
import '../reuseable_widgets/rounded_textfield.dart';
import '../screens/home/components/top_bar_component.dart';
import 'Search_result.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cGrey.withOpacity(0.1),
        // key: scaffoldKey,
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
          title: const Appbar(),
          backgroundColor: colorWhite,
        ),
        body: Column(
          children: [
            Padding(
              padding: padA5,
              child: Column(
                children: [
                  ReuseTextField(

suffixIcon: Icon(Icons.search),
                    onTap: () {
                      Get.to(() => Search());
                    },
                    onChanged: (val) {},
                    fontSize: 15,
                    height: 5.6.h,
                    borderRadius: 4,
                    width: 100.w,
                    hinttext: "What are you looking for ?",
                    hintTextColor: cBlack.withOpacity(0.4),
                    ontapborderRadius: 4,
                    fill: true,
                    fillcolor: cGrey.withOpacity(0.1),

                    controller: searchController,
                    obsecure: false,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          onTap: (){
                            _showcategories();
                          },
                          leading: Text("Browse Catagories",style: hMedium.copyWith(fontSize: 15,color: cBlack),),
                          trailing: Icon(Icons.arrow_forward_ios_sharp),

                        ),
                      ),
                      RoundedButton(
                          backGroundColor: appthem,
                          textButton: "Search", onTap: (){
                            Get.to(()=>SearchPage());
                      }),
                    ],
                  ),
               
                ],
              ),
            ),



          ],
        ));
  }
  Future<void> _showcategories() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        int cityid = 0;
        String cityname = '';
        return AlertDialog(
          title: const Text('Select Category'),
          content: SizedBox(
              height: Get.height * .45,
              width: 100,
              child: ListView.builder(
                //scrollDirection: Axis.horizontal,
                itemCount: 16,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child:Chip(
                          backgroundColor: cGrey,
                          label: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 5),
                            child: Text("bad",
                                style: TextStyle(
                                    color: Colors.cyan)),
                          ),
                        )
                      ),
                    ],
                  );
                },
              )),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.black))),
              ),
              child: const Text(
                'Submit',
              ),
              onPressed: () {

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
