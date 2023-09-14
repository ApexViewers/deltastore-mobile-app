
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/decorations.dart';
import '../../../../constant/paddings.dart';
import '../../../../constant/routs_strings/routs_strings.dart';
import '../../../../constant/spacing.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';
import '../../../../reuseable_widgets/rounded_button.dart';
import '../../../address/view/address_screen.dart';
import '../../../home/components/top_bar_component.dart';
import '../../controller/add_to_cart_controller.dart';

class AddToCart extends StatefulWidget {
  String? prooductImage;
  String? prooductName;
  dynamic prooductPrice;
  dynamic salePrice;
  String? id;

  AddToCart(
      {Key? key, this.prooductImage, this.prooductName, this.prooductPrice,this.id,this.salePrice})
      : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int initialValue = 0;
  var valueChange =0;
  int prooductPrice = 700;
  String finlaPrice = "";
  List<double> productPrices = [];
  TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.id.toString()+"shod id data");
    int priceChange = int.parse(widget.prooductPrice.toString());
    var addToCartController = Get.find<AddToCartController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorWhite,
        title: TopBarComponent(),
      ),
      backgroundColor: colorWhite.withOpacity(0.9),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: padA5,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => AddressScreen());
                    },
                    child: Card(
                      child: Padding(
                        padding: padA5.add(EdgeInsets.only(top: 0, bottom: 4)),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Padding(
                              padding:
                                  padA5.add(EdgeInsets.only(top: 4, bottom: 4)),
                              child: Text(
                                "Add new Address",
                                style: hMedium.copyWith(
                                    color: cBlack, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100.w,
                    child: ListView.builder(
                        physics: PageScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:1 ,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: padA6,
                            child: Column(
                              children: [
                                Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: padA5,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      bottom: 10,
                                                      top: 10),
                                                  height: 6.h,
                                                  width: 12.w,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(widget
                                                          .prooductImage
                                                          .toString()),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Flexible(
                                              child: Padding(
                                            padding: padA5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            widget.prooductName
                                                                .toString(),
                                                            style: hMedium.copyWith(
                                                                fontSize: 10,
                                                                color: cBlack
                                                                    .withOpacity(
                                                                        0.6)),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                widget
                                                                    .prooductPrice
                                                                    .toString(),
                                                                style: hMedium.copyWith(
                                                                    fontSize:
                                                                        10,
                                                                    color: cBlack
                                                                        .withOpacity(
                                                                            0.9)),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: padA5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color: cGrey),
                                                  color: colorWhite
                                                      .withOpacity(0.9),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              if (addToCartController
                                                                      .initialValue >
                                                                  0) {
                                                                addToCartController
                                                                    .initialValue--;
                                                                addToCartController
                                                                    .valueChange
                                                                    .value = addToCartController
                                                                        .initialValue
                                                                        .value *
                                                                    addToCartController
                                                                        .prooductPrice
                                                                        .value;
                                                              }
                                                              valueChange = int
                                                                      .parse(widget
                                                                          .prooductPrice
                                                                          .toString()) *
                                                                  addToCartController
                                                                      .initialValue
                                                                      .value;
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: cBlack
                                                                .withOpacity(
                                                                    0.7),
                                                          )),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(addToCartController
                                                          .initialValue.value
                                                          .toString()),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              addToCartController
                                                                  .initialValue
                                                                  .value++;
                                                              addToCartController
                                                                  .valueChange
                                                                  .value = addToCartController
                                                                      .initialValue
                                                                      .value *
                                                                  addToCartController
                                                                      .prooductPrice
                                                                      .value;

                                                              valueChange = int
                                                                      .parse(widget
                                                                          .prooductPrice
                                                                          .toString()) *
                                                                  addToCartController
                                                                      .initialValue
                                                                      .value;
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            color: cBlack
                                                                .withOpacity(
                                                                    0.7),
                                                            size: 20,
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: padA5
                                                .add(EdgeInsets.only(left: 10)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color: cGrey),
                                                  color: colorWhite
                                                      .withOpacity(0.9),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: padA6.add(
                                                        EdgeInsets.only(
                                                            left: 5)),
                                                    child: Icon(
                                                      Icons.favorite_border,
                                                      color: cBlack
                                                          .withOpacity(0.3),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: padA5,
                                                    child: Text(
                                                      "Move to wishlist",
                                                      style: hsmall.copyWith(
                                                          color: cBlack
                                                              .withOpacity(
                                                                  0.6)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: padA5
                                                .add(EdgeInsets.only(left: 0)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color: cGrey),
                                                  color: colorWhite
                                                      .withOpacity(0.9),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.delete_outline,
                                                    color:
                                                        cBlack.withOpacity(0.3),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    child: Card(
                      child: Padding(
                        padding: padA5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Order Summary",
                                  style: hMedium.copyWith(
                                      color: cBlack, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal",
                                  style: hsmall.copyWith(
                                      color: cBlack, fontSize: 15),
                                ),
                                Text(
                                  widget.prooductPrice.toString(),
                                  style: hsmall.copyWith(
                                      color: cBlack, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shoping",
                                  style: hMedium.copyWith(
                                      color: cBlack, fontSize: 15),
                                ),
                                Text(
                                  widget.prooductPrice.toString(),
                                  style: hsmall.copyWith(
                                      color: cBlack, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "total",
                                  style: hMedium.copyWith(
                                      color: cBlack, fontSize: 15),
                                ),
                                Text(
                                    valueChange.toString() == "0" // Compare with string "0" since you're comparing to a string later
                                      ? widget.prooductPrice.toString()
                                      : valueChange.toString(),
                                  style: hsmall.copyWith(
                                      color: cBlack, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 100.w,
          color: colorWhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( widget.prooductPrice.toString(),
                        style: hsmall.copyWith(color: cBlack.withOpacity(0.6))),
                    Text("AED 1000",
                        style: hMedium.copyWith(
                          color: cGrey,
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: RoundedButton(
                    borderRadius: 12,
                    height: 6.h,
                    width: 50.w,
                    backGroundColor: appthem,
                    textButton: "Check Out",
                    onTap: () {
                      Navigator.pushNamed(context, addressScreen);
                    }),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
