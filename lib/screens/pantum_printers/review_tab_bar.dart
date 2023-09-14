
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

import '../../constant/paddings.dart';
import '../../constant/styles/app_textstyles.dart';
import '../../constant/styles/colors.dart';
import '../../reuseable_widgets/rounded_button.dart';
import '../../reuseable_widgets/textformfield_contact.dart';

class ReviewTabBar extends StatefulWidget {
  const ReviewTabBar({Key? key}) : super(key: key);

  @override
  State<ReviewTabBar> createState() => _ReviewTabBarState();
}

class _ReviewTabBarState extends State<ReviewTabBar> {
  bool _isChecked = false;
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(

        color: cGrey.withOpacity(0.2),

    border: Border.all(
    color: cGrey.withOpacity(0.2),
    ),
    borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: padA5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.h,),
                        Text(
                          "Based on 0 reviews",
                          style: hsmall,
                        ),
                        Text(
                          "0.0",
                          style: hMedium.copyWith(color: cBlack),
                        ),
                        SizedBox(height: 1.h,),
                        Text(
                          "overall",
                          style: hsmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your Rating   :",
                              style:
                                  hMedium.copyWith(color: cBlack, fontSize: 14),
                            ),
                            RatingBar.builder(
                              unratedColor: cGrey,
                              glowColor: appthem,
                              glow: true,
                              itemSize: 16,
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                size: 8,
                                color:appthem,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: padA5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Your Review  :",
                  style: hMedium.copyWith(color: cBlack, fontSize: 14),
                ),
                SizedBox(width: 16), // Add spacing between the fields
                Expanded(
                  child: RoundTextFormField(
                    fill: true,
                    fillcolor: colorWhite,
                    obsecure: false,
                    controller: reviewController,
                    maxLint: 5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: padA5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "Name",
                      style: hMedium.copyWith(color: cBlack, fontSize: 14),
                    ),
                    Text(
                      "*",
                      style: hMedium.copyWith(color: Colors.red, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(width: 7.h), // Add spacing between the fields
                Expanded(
                  child: RoundTextFormField(
                    fill: true,
                    fillcolor: colorWhite,
                    obsecure: false,
                    controller: reviewController,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: padA5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "email",
                      style: hMedium.copyWith(color: cBlack, fontSize: 14),
                    ),
                    Text(
                      "*",
                      style: hMedium.copyWith(color: Colors.red, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(width: 7.h), // Add spacing between the fields
                Expanded(
                  child: RoundTextFormField(
                    obsecure: false,
                    fill: true,
                    fillcolor: colorWhite,

                    controller: reviewController,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h,),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: Text("Save my name, email, and website in this browser for the next time I comment.",style: hsmall,),
            controlAffinity: ListTileControlAffinity.leading,
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
              });
            },
          ),
          RoundedButton(
            width: 60.w,
              
              textButton: "Add Review", onTap: (){}),
          Padding(
            padding: padA5,
            child: Row(
              children: [
                Padding(
                  padding: padA5,
                  child: Text("There are no reviews yet. ",style: hsmall.copyWith(color: cBlack),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
