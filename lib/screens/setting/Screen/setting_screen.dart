
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/image_assets.dart';
import '../../../constant/paddings.dart';
import '../../../constant/styles/colors.dart';
import '../component/sittingConponent.dart';

class ListOfSettingItem extends StatefulWidget {
  const ListOfSettingItem({Key? key}) : super(key: key);

  @override
  State<ListOfSettingItem> createState() => _ListOfSettingItemState();
}

class _ListOfSettingItemState extends State<ListOfSettingItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: cBlack,)),
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
      backgroundColor: colorWhite.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Padding(
          padding:padA5,
          child: Column(
            children: [ListComponent()],
          ),
        ),
      ),
    );
  }
}
