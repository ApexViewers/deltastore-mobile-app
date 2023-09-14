
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/paddings.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../reuseable_widgets/rounded_button.dart';
import '../../../reuseable_widgets/rounded_textfield.dart';
import '../../../reuseable_widgets/textformfield_contact.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController contactPersonController =TextEditingController();
  TextEditingController phonNumberController =TextEditingController();
  TextEditingController streetController =TextEditingController();
  TextEditingController buildingController =TextEditingController();
  TextEditingController cityController =TextEditingController();
  TextEditingController areaController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appthem,
        centerTitle: false,
        title: Text("Add Address",style: hsmall.copyWith(fontSize: 19,color: colorWhite),),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: padA5.add(EdgeInsets.symmetric(horizontal: 12)),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      textWidget(text: "Contact Person"),
                      SizedBox(height: 4),
                      RoundTextFormField(
                        width: 100.w,
                        borderRadius: 6,
                        ontapborderRadius: 6,

                        controller:contactPersonController , obsecure: false,),
                      SizedBox(height: 15),
                      textWidget(text: "Phone Number"),
                      SizedBox(height: 4),
                      RoundTextFormField(
                        width: 100.w,
                        ontapborderRadius: 6,
                        borderRadius: 6,

                        controller:phonNumberController , obsecure: false,),
                      SizedBox(height: 15),
                      textWidget(text: "Street /Apartment/Valla"),
                      SizedBox(height: 4),
                      RoundTextFormField(
                        width: 100.w,
                        ontapborderRadius: 6,
                        borderRadius: 6,

                        controller:streetController , obsecure: false,),
                      SizedBox(height: 15),
                      textWidget(text: "Building/Property"),
                      SizedBox(height: 4),
                      RoundTextFormField(
                        width: 100.w,
                        ontapborderRadius: 6,
                        borderRadius: 6,

                        controller:buildingController , obsecure: false,),
                      SizedBox(height: 15),
                      textWidget(text: "City"),
                      SizedBox(height: 4),
                      RoundTextFormField(
                        width: 100.w,
                        ontapborderRadius: 6,
                        borderRadius: 6,

                        controller:cityController , obsecure: false,),
                      SizedBox(height: 15),
                      textWidget(text: "Area/District"),
                      SizedBox(height: 4),
                      RoundTextFormField(
                        width: 100.w,
                        ontapborderRadius: 6,
                        borderRadius: 6,

                        controller:areaController , obsecure: false,),
                      SizedBox(height: 15),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              RoundedButton(

                width: 80.w,
                height: 6.h,
                backGroundColor: appthem,
                textButton: 'Save Address', onTap: () {  },
                borderRadius: 12,

              )
            ],
          ),
        ),
      ),
    );
  }
  Widget textWidget({text}){
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(text,style: hMedium.copyWith(fontSize: 15,color: cBlack),),
        ),
      ],
    );
  }
}
