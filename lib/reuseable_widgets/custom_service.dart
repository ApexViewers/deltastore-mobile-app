import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../constant/styles/app_textstyles.dart';

class CustomServices extends StatelessWidget {
  IconData ?customIcon;
  String? text1;
  String? text2;
  String? text3;
  double ?width;
  final String ?imagePath;
   CustomServices({Key? key,this.customIcon,this.text1,this.text2,this.text3,this.width,this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s=MediaQuery.of(context).size;
    return Container(

      width: width,
      child: Column(
        children: [
          SizedBox(height:s.height*0.009,),
          Image.asset(
              width: 5.h,
              imagePath.toString()),
          SizedBox(height:s.height*0.007 ,),
          Text(text1!,style: hsmall,),
          SizedBox(height:s.height*0.007 ,),
          Text(text2!,style: hsmall,),
          SizedBox(height:s.height*0.007 ,),
          Text(text3!,style: hsmall,),
          SizedBox(height:s.height*0.007,),

        ],
      ),
    );
  }
}
