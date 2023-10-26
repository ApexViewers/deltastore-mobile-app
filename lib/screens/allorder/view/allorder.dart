import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/screens/laptops/components/empty_cart_container.dart';

import '../../../constant/decorations.dart';
import '../../../constant/paddings.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/cart_controller/cart_controller.dart';
import '../../../data/Controllers/items_in_cart_controller/item_in_cart_controller.dart';
import '../../../data/Controllers/total_amount_cart_controller/total_amount_controller.dart';
import '../../../reuseable_widgets/appbar_widget.dart';
import '../../../reuseable_widgets/rounded_button.dart';
import '../../address/view/address_screen.dart';
import '../../home/view/home.dart';
import '../../laptops/controller/add_to_cart_controller.dart';

class AllOrder extends StatefulWidget {
  String? prooductImage;
  String? prooductName;
  String? prooductPrice;
  AllOrder(
      {Key? key, this.prooductPrice, this.prooductImage, this.prooductName})
      : super(key: key);

  @override
  State<AllOrder> createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> {
  final CartController cartController = Get.put(CartController());
  var itemController = Get.put((ItemInCartController()));
  var totalAmoutController = Get.put(TotalAmountController());
  int initialValue = 0;
  int valueChange = 0;
  int prooductPrice = 700;
  List<double> productPrices = [];

  Future<void> refreshScreen() async {
    cartController.fetchCartData();
    itemController.fetchDataFromApi();
    totalAmoutController.totalAmountToCart();
    //Get.snackbar('Refresh', 'Screen is Refreshing');

  }
  @override
  Widget build(BuildContext context) {
    var addToCartController = Get.find<AddToCartController>();
    return WillPopScope(
      onWillPop: () async {
        Get.to(() => const HomeScreen());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Appbar(),
          backgroundColor: colorWhite,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: padA5,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const AddressScreen());
                          },
                          child: Card(
                            child: Padding(
                              padding: padA5.add(
                                  const EdgeInsets.only(top: 0, bottom: 4)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Padding(
                                    padding: padA5.add(const EdgeInsets.only(
                                        top: 4, bottom: 4)),
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
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 100.w,
                          child: FutureBuilder(
                            future: cartController.fetchCartData(),
                            builder: (ctx, snapshot) {
                              bool? received = snapshot.data;
                              if (snapshot.hasData) {
                                if (received!) {
                                  return Obx(() {
                                    if (cartController
                                        .cartData.value.items.isEmpty) {
                                      return EmptyCartContainer.showAppBar(
                                          showAppBar: false);
                                    } else {
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          refreshScreen();
                                        },
                                        child: ListView.builder(
                                            physics: const AlwaysScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: cartController
                                                .cartData.value.items.length,
                                            itemBuilder: (context, index) {
                                              var item = cartController
                                                  .cartData.value.items[index];
                                              return Padding(
                                                padding: padA6,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          productBox.copyWith(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        padA5,
                                                                    child:
                                                                        Container(
                                                                      margin: const EdgeInsets.only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10,
                                                                          bottom:
                                                                              10,
                                                                          top:
                                                                              10),
                                                                      height: 6.h,
                                                                      width: 12.w,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        image:
                                                                            DecorationImage(
                                                                          image: NetworkImage(
                                                                              item.featuredImage),
                                                                          fit: BoxFit
                                                                              .cover,
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
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Text(
                                                                                item.name,
                                                                                style: hMedium.copyWith(fontSize: 10, color: cBlack.withOpacity(0.6)),
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    "AED ${item.price}",
                                                                                    style: hMedium.copyWith(fontWeight: FontWeight.bold, fontSize: 12, color: cBlack.withOpacity(0.9)),
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
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: padA5,
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              cGrey),
                                                                      color: colorWhite
                                                                          .withOpacity(
                                                                              0.9),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4)),
                                                                  child: Row(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                setState(() {
                                                                                  if (addToCartController.initialValue > 0) {
                                                                                    addToCartController.initialValue--;
                                                                                    addToCartController.valueChange.value = addToCartController.initialValue.value * addToCartController.prooductPrice.value;
                                                                                  }
                                                                                });
                                                                              },
                                                                              child:
                                                                                  Icon(
                                                                                Icons.remove,
                                                                                color: cBlack.withOpacity(0.7),
                                                                              )),
                                                                          const SizedBox(
                                                                            width:
                                                                                4,
                                                                          ),
                                                                          Text(addToCartController
                                                                              .initialValue
                                                                              .value
                                                                              .toString()),
                                                                          const SizedBox(
                                                                            width:
                                                                                4,
                                                                          ),
                                                                          InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                setState(() {
                                                                                  addToCartController.initialValue.value++;
                                                                                  addToCartController.valueChange.value = addToCartController.initialValue.value * addToCartController.prooductPrice.value;
                                                                                });
                                                                              },
                                                                              child:
                                                                                  Icon(
                                                                                Icons.add,
                                                                                color: cBlack.withOpacity(0.7),
                                                                                size: 20,
                                                                              )),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: padA5.add(
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10)),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              cGrey),
                                                                      color: colorWhite
                                                                          .withOpacity(
                                                                              0.9),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4)),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: padA6.add(const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                5)),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .favorite_border,
                                                                          color: cBlack
                                                                              .withOpacity(0.3),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            padA5,
                                                                        child:
                                                                            Text(
                                                                          "Move to wishlist",
                                                                          style: hsmall.copyWith(
                                                                              color:
                                                                                  cBlack.withOpacity(0.6)),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: padA5.add(
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10)),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              cGrey),
                                                                      color: colorWhite
                                                                          .withOpacity(
                                                                              0.9),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4)),
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .delete_outline,
                                                                        color: cBlack
                                                                            .withOpacity(
                                                                                0.3),
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
                                      );
                                    }
                                  });
                                } else {
                                  return EmptyCartContainer.showAppBar(
                                    showAppBar: false,
                                  );
                                }
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: padA5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
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
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Subtotal",
                                      style: hsmall.copyWith(
                                          color: cBlack, fontSize: 15),
                                    ),
                                    Text(
                                      totalAmoutController.totalAmountModel
                                                  .totals?.subtotal !=
                                              null
                                          ? totalAmoutController
                                              .totalAmountModel.totals!.subtotal
                                              .toString()
                                          : '0',
                                      style: hsmall.copyWith(
                                          color: cBlack, fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Shipping",
                                      style: hMedium.copyWith(
                                          color: cBlack, fontSize: 15),
                                    ),
                                    Text(
                                      totalAmoutController.totalAmountModel
                                                  .totals?.shippingTotal !=
                                              null
                                          ? totalAmoutController
                                              .totalAmountModel
                                              .totals!
                                              .shippingTotal
                                              .toString()
                                          : '0',
                                      style: hsmall.copyWith(
                                          color: cBlack, fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: hMedium.copyWith(
                                          color: cBlack, fontSize: 15),
                                    ),
                                    Text(
                                      totalAmoutController.totalAmountModel
                                                  .totals?.total !=
                                              null
                                          ? totalAmoutController
                                              .totalAmountModel.totals!.total
                                              .toString()
                                          : '0',
                                      style: hsmall.copyWith(
                                          color: cBlack, fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
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
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "AED ${totalAmoutController.totalAmountModel.totals?.total != null ? totalAmoutController.totalAmountModel.totals!.total : 0.toString()}",
                              style: hsmall.copyWith(
                                  color: cBlack.withOpacity(0.6))),
                          // Text("AED 1000",
                          //     style: hMedium.copyWith(
                          //       color: cGrey,
                          //       fontSize: 16,
                          //       decoration: TextDecoration.lineThrough,
                          //     )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 8),
                      child: RoundedButton(
                          borderRadius: 12,
                          height: 6.h,
                          width: 50.w,
                          backGroundColor: appthem,
                          textButton: "Check Out",
                          onTap: () {
                            Get.to(() => const AddressScreen());
                          }),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
