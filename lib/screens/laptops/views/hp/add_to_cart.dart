import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/paddings.dart';
import '../../../../constant/routs_strings/routs_strings.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';
import '../../../../data/Controllers/addto_cart_controller/addto_cart.dart';
import '../../../../data/Controllers/delete_cart_controller/delete_cart_controller.dart';
import '../../../../data/Controllers/increment_account_controller/increment_quantity_controller.dart';
import '../../../../data/Controllers/items_in_cart_controller/item_in_cart_controller.dart';
import '../../../../data/Controllers/product_by_id_controller/product_by_id_controller.dart';
import '../../../../data/Controllers/total_amount_cart_controller/total_amount_controller.dart';
import '../../../../reuseable_widgets/rounded_button.dart';
import '../../../address/view/address_screen.dart';
import '../../../home/components/top_bar_component.dart';

class AddToCart extends StatefulWidget {


  const AddToCart({super.key });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  String item = '';

  // final ItemInCartController itemController = Get.find<ItemInCartController>();
  var itemController = Get.put((ItemInCartController()));
  var Deleteitem = Get.put((DeleteCartDataController()));
  var totalAmoutController = Get.put(TotalAmountController());
  var incrementAmountController = Get.put(IncrementAmountController());
  var valueChange;
  var ProductidController = Get.put((ProductIdController()));
  var addToCartController = Get.put((AddToCartDataController()));




  @override
  Widget build(BuildContext context) {

    // print(totalAmoutController.totalAmountModel.totals!.shippingTotal.toString());
    // print(totalAmoutController.totalAmountModel.totals!.total.toString());
    // print(totalAmoutController.totalAmountModel.totals!.subtotal.toString());
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: colorWhite,
            title: const TopBarComponent(),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: cBlack),
              onPressed: () {
                // Navigate back to the previous screen.
                Navigator.pop(context);

                // Reset the "Add to Cart" button text.
                addToCartController
                    .resetButtonText(); // Replace 'addCartDataController' with your controller instance.
              },
            )),
        backgroundColor: colorWhite.withOpacity(0.9),
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
                              padding:
                                  padA5.add(const EdgeInsets.only(top: 0, bottom: 4)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Padding(
                                    padding: padA5.add(
                                        const EdgeInsets.only(top: 4, bottom: 4)),
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
                        RefreshIndicator(
                          onRefresh: () async {
                            build(context);
                          },
                          child: Obx(() {
                            if (itemController.isLoading.value) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (itemController.error.value.isNotEmpty) {
                              return Center(
                                  child: Text(itemController.error.value));
                            } else if (itemController.items.isEmpty) {
                              return RefreshIndicator(
                                  onRefresh: () async {
                                build(context);
                              },child: const Center(child: Text("No items in the cart")));
                            } else {
                              return Column(
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        build(context);
                                      },
                                      child: ListView.builder(
                                          physics: const PageScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: itemController.items.length,
                                          itemBuilder: (context, index) {
                                            final item = itemController.items.values
                                                .elementAt(index);
                                            print(itemController.items.isEmpty);
                                            // valueChange=item['quantity']['value'];
                                            int remainingStock = item['quantity']
                                                    ['max_purchase'] -
                                                item['quantity']['value'];
                                            if(itemController.error.value != 'String parse error'){
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
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: padA5,
                                                                    child: Container(
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          left: 10,
                                                                          right: 10,
                                                                          bottom: 10,
                                                                          top: 10),
                                                                      height: 6.h,
                                                                      width: 12.w,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        image:
                                                                        DecorationImage(
                                                                          image: NetworkImage(
                                                                              item['featured_image']
                                                                                  .toString()),
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
                                                                                    item[
                                                                                    'name'],
                                                                                    style: hMedium.copyWith(
                                                                                        fontSize: 10,
                                                                                        color: cBlack.withOpacity(0.6)),
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      Text(
                                                                                        item['price'],
                                                                                        style: hMedium.copyWith(fontSize: 10, color: cBlack.withOpacity(0.9)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      Text(
                                                                                        "${"Limited stock :" ' '}${'only' ' '}$remainingStock${" left -"}${"order now"}",
                                                                                        style: hMedium.copyWith(fontSize: 12, color: cRed.withOpacity(0.9)),
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
                                                                      BorderRadius
                                                                          .circular(
                                                                          4)),
                                                                  child: Row(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              setState(
                                                                                      () {
                                                                                    int initialValue =
                                                                                    int.parse(item['quantity']['value'].toString());
                                                                                    itemController.incrementAmountToCart(
                                                                                        (initialValue - 1).toString(),
                                                                                        item['item_key']);

                                                                                    // Update the total amount
                                                                                  });
                                                                              // totalAmoutController.totalAmountToCart();
                                                                              //
                                                                              // // Add a delay before calling the API
                                                                              // // 2 seconds delay
                                                                              //
                                                                              // // Call the API to fetch data
                                                                              // itemController.fetchDataFromApi();
                                                                            },
                                                                            child:
                                                                            Icon(
                                                                              Icons
                                                                                  .remove,
                                                                              color: cBlack
                                                                                  .withOpacity(0.7),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width: 4,
                                                                          ),
                                                                          Text(item['quantity']
                                                                          [
                                                                          'value']
                                                                              .toString()),
                                                                          const SizedBox(
                                                                            width: 4,
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              setState(
                                                                                      () {
                                                                                    int initialValue =
                                                                                    int.parse(item['quantity']['value'].toString());
                                                                                    int incrementedValue =
                                                                                        initialValue + 1;
                                                                                    // totalAmoutController.totalAmountToCart();

                                                                                    // Call the controller method to increment the amount
                                                                                    itemController.incrementAmountToCart(
                                                                                        incrementedValue.toString(),
                                                                                        item['item_key']);

                                                                                    // Add a delay before calling the API

                                                                                    // itemController.fetchDataFromApi();
                                                                                  });
                                                                            },
                                                                            child:
                                                                            Icon(
                                                                              Icons
                                                                                  .add,
                                                                              color: cBlack
                                                                                  .withOpacity(0.7),
                                                                              size:
                                                                              20,
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: padA5.add(
                                                                    const EdgeInsets.only(
                                                                        left: 10)),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                          cGrey),
                                                                      color: colorWhite
                                                                          .withOpacity(
                                                                          0.9),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          4)),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: padA6.add(
                                                                            const EdgeInsets.only(
                                                                                left:
                                                                                5)),
                                                                        child: Icon(
                                                                          Icons
                                                                              .favorite_border,
                                                                          color: cBlack
                                                                              .withOpacity(
                                                                              0.3),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                        padA5,
                                                                        child: Text(
                                                                          "Move to wishlist",
                                                                          style: hsmall
                                                                              .copyWith(
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
                                                                    const EdgeInsets.only(
                                                                        left: 0)),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    setState(() async {
                                                                      itemController
                                                                          .deleteToCart(
                                                                          item['item_key']
                                                                              .toString());
                                                                      totalAmoutController
                                                                          .totalAmountToCart();
                                                                      print(item[
                                                                      'item_key']);
                                                                      await Future.delayed(const Duration(seconds: 5));
                                                                    });

                                                                    // Add your delete item logic here
                                                                  },
                                                                  child: Container(
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                          cGrey),
                                                                      color: colorWhite
                                                                          .withOpacity(
                                                                          0.9),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          4),
                                                                    ),
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
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            else{
                                              return const Center(
                                                child: Text("List Empty"),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Card(
                                          child: Padding(
                                            padding: padA5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                const SizedBox(
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
                                                const SizedBox(
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
                                                const SizedBox(
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
                                                const SizedBox(
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
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              );
                            }
                          }),
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
                      padding: const EdgeInsets.only(right: 18,bottom: 18),
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
            ]));
  }
}
// ListView.builder(
//             itemCount: itemController.items.length,
//             itemBuilder: (context, index) {
//               final item = itemController.items.values.elementAt(index);
//               return ListTile(
//                 title: Text(item['title']),
//                 subtitle: Text('Price: \$${item['price']}'),
//                 // You can display other item details here
//               );
//             },
//           );
