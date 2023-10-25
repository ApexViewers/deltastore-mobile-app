import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/constant/base_client.dart';
import 'package:test_app/screens/laptops/components/empty_cart_container.dart';
import '../../../constant/paddings.dart';
import '../../../constant/routs_strings/routs_strings.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/cart_controller/cart_controller.dart';
import '../../../data/Controllers/total_amount_cart_controller/total_amount_controller.dart';
import '../../../reuseable_widgets/appbar_widget.dart';
import '../../../reuseable_widgets/rounded_button.dart';
import '../../address/view/address_screen.dart';
import '../../home/view/home.dart';
import 'package:test_app/constant/app_urls/app_urls.dart';

class CartView extends StatefulWidget {

  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CartController cartController = Get.put(CartController());

  var totalAmoutController = Get.put(TotalAmountController());

  bool checkoutBtn = false;

  @override
  Widget build(BuildContext context) {
    cartController.fetchCartData();
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: 70,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                style: BorderStyle.solid, color: Colors.black),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            'Add new address',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      onTap: () {
                        //TODO: Implement Add new address functionality
                        Get.to(() => const AddressScreen());
                      },
                    ),
                  ),
                ),
                FutureBuilder(
                  future: cartController.fetchCartData(),
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      bool received = snapshot.data!;
                      if (received) {
                        return Obx(
                          () {
                            if (cartController.cartData.value.items.isEmpty) {
                              return EmptyCartContainer.showAppBar(
                                  showAppBar: false);
                            } else {
                              checkoutBtn = true;
                              return Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: cartController
                                            .cartData.value.items.length,
                                        itemBuilder: (context, index) {
                                          final item = cartController
                                              .cartData.value.items[index];
                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      leading: item.featuredImage !=
                                                              null
                                                          ? Image.network(
                                                              item.featuredImage,
                                                              width: 50,
                                                              height: 50,
                                                              fit: BoxFit.cover,
                                                              errorBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Object
                                                                          exception,
                                                                      StackTrace?
                                                                          stackTrace) {
                                                              return const Icon(
                                                                  Icons.image);
                                                            })
                                                          : const Icon(Icons
                                                              .image), // Display default icon if image is not available
                                                      title: Text(item.name),
                                                      subtitle: Row(
                                                        children: [
                                                          const Text(
                                                              '\nAED '),
                                                          Text('\n${item.price.toString()}.00',style: const TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 15,
                                                            color: Colors.black
                                                          ),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(5),
                                                              border: Border.all(
                                                                  style: BorderStyle
                                                                      .solid,
                                                                  width: 0.9,
                                                                  color: Colors.grey),
                                                            ),
                                                            height: 40,
                                                            width: Get.width * 0.26,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                IconButton(
                                                                  onPressed: () {
                                                                    item.quantity
                                                                                .value ==
                                                                            item.quantity
                                                                                .minPurchase
                                                                        ? null
                                                                        : () {};
                                                                  },
                                                                  icon: const Icon(
                                                                    Icons.remove,
                                                                    size: 15,
                                                                  ),
                                                                  disabledColor:
                                                                      Colors.grey,
                                                                ),
                                                                Text(
                                                                  item.quantity.value
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontSize: 13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                IconButton(
                                                                  onPressed: () {},
                                                                  icon: const Icon(
                                                                    Icons.add,
                                                                    size: 15,
                                                                  ),
                                                                  disabledColor:
                                                                      Colors.grey,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 40,
                                                            width: Get.width * 0.5,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        Colors.grey,
                                                                    style: BorderStyle
                                                                        .solid,
                                                                width: 0.9),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(5)),
                                                            child: const Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                                                    child: Icon(Icons.heart_broken_outlined,color: Colors.blueGrey,),
                                                                  ),
                                                                  Text(
                                                                      'Move to Wishlist',
                                                                  style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.blueGrey,
                                                                    fontSize: 14
                                                                  ),),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 40,
                                                            width: Get.width * 0.1,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                    Colors.grey,
                                                                    style: BorderStyle
                                                                        .solid,
                                                                    width: 0.9),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(5)),
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  setState(() async {
                                                                    BaseClientClass.delete(
                                                                        '${AppUrls.baseAddressAlt}${AppUrls.deleteItemFromCart}${item.itemKey}');
                                                                    await Future.delayed(
                                                                        const Duration(
                                                                            seconds: 5));
                                                                  });

                                                                    Get.snackbar(
                                                                        'Deleted Successfully',
                                                                        '${item.title} deleted successfully');
                                                                },
                                                                icon: const Icon(
                                                                    Icons.delete_outline),color: Colors.blueGrey,),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      child: Card(
                                        child: Padding(
                                          padding: padA5,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Order Summary",
                                                    style: hMedium.copyWith(
                                                        color: cBlack,
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Subtotal",
                                                    style: hsmall.copyWith(
                                                        color: cBlack
                                                            .withOpacity(0.5),
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    totalAmoutController
                                                        .totalAmountModel
                                                        .totals!
                                                        .subtotal
                                                        .toString(),
                                                    style: hsmall.copyWith(
                                                      color: cBlack
                                                          .withOpacity(0.5),
                                                      fontSize: 15,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Shoping",
                                                    style: hMedium.copyWith(
                                                        color: cBlack
                                                            .withOpacity(0.5),
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    totalAmoutController.totalAmountModel.totals!.shippingTotal.toString(),
                                                    style: hsmall.copyWith(
                                                        color: cBlack
                                                            .withOpacity(0.5),
                                                        fontSize: 15),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Total",
                                                    style: hMedium.copyWith(
                                                        color: cBlack,
                                                        fontSize: 12),
                                                  ),
                                                  Text(
                                                    totalAmoutController.totalAmountModel.totals!.total.toString(),
                                                    style: hsmall.copyWith(
                                                        color: cBlack,
                                                        fontSize: 12),
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
                                            child: const Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // Text(  "${addToCartController.addToCartModel.currency!.currencyCode.toString() + " "}${addToCartController.addToCartModel.items![0].totals!.total.toString()}",
                                                //     style: hMedium.copyWith(
                                                //       color: cBlack,
                                                //       fontSize: 16,
                                                //
                                                //     )),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 18,bottom: 10,top: 10),
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
                                  ],
                                ),
                              );
                            }
                          },
                        );
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
