import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/email_validator.dart';
import '../../../../constant/fonts_strings.dart';
import '../../../../constant/image_assets.dart';
import '../../../../constant/loading/ShimmerEffectloading.dart';
import '../../../../constant/loading/shimmerEffect_full_page.dart';
import '../../../../constant/paddings.dart';
import '../../../../constant/spacing.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';
import '../../../../data/Controllers/addto_cart_controller/addto_cart.dart';
import '../../../../data/Controllers/all_product_controller/all_product_controller.dart';
import '../../../../data/Controllers/product_by_id_controller/product_by_id_controller.dart';
import '../../../../data/Controllers/total_amount_cart_controller/total_amount_controller.dart';
import '../../../../reuseable_widgets/rounded_button.dart';
import '../../../../reuseable_widgets/textformfield_contact.dart';
import '../../../pantum_printers/our_gauarantee_to_you.dart';
import '../../components/hp_laptop_component/hp_laptop_slider.dart';
import '../../components/laptop_listview_products_component.dart';
import 'add_to_cart.dart';

class HpLaptopDetailsScreen extends StatefulWidget {
  String? nameProduct;
  String? priceProduct;
  String? lessPriceProduct;
  String? imageProduct;
  String? productCategories;

  HpLaptopDetailsScreen(
      {Key? key,
      this.nameProduct,
      this.imageProduct,
      this.priceProduct,
      this.lessPriceProduct,
      this.productCategories})
      : super(key: key);

  @override
  State<HpLaptopDetailsScreen> createState() => _HpLaptopDetailsScreenState();
}

class _HpLaptopDetailsScreenState extends State<HpLaptopDetailsScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController priceController = TextEditingController();
  bool addText = false;
  late TabController _tabController;
  var ProductidController = Get.put((ProductIdController()));
  var addToCartController = Get.put((AddToCartDataController()));
  var totalAmoutController=Get.put(TotalAmountController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentNameController = TextEditingController();

  var allProductController = Get.put(AllProductController());

  @override
  Widget build(BuildContext context) {
    print("test1");
    return Scaffold(
        backgroundColor: colorWhite.withOpacity(0.9),
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
          title: Padding(
            padding: const EdgeInsets.symmetric(),
            child: SizedBox(
              width: 60.w,
              child: Image.asset(
                ImageAssests.logoImge.toString(),
              ),
            ),
          ),
          backgroundColor: colorWhite,
        ),
        body: Obx(
          () => ProductidController.productLoading.value
              ? FullPageShimmerEffect()
              : ProductidController.productError.value != ''
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              ProductidController.productBYid;
                            },
                            icon: const Icon(Icons.refresh)),
                        Text(ProductidController.productError.value),
                      ],
                    ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: padA5,
                              child: Column(
                                children: [
                                  const HpImageSlider(),
                                  Card(
                                    child: Padding(
                                      padding: padA5,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: padA6,
                                            child: Row(
                                              children: [
                                                Text(
                                                    ProductidController
                                                        .productBYid
                                                        .regularPrice
                                                        .toString(),
                                                    style: hMedium.copyWith(
                                                      color: cGrey,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width <
                                                                  600
                                                              ? 11
                                                              : 16,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    )),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  ProductidController
                                                      .productBYid.salePrice
                                                      .toString(),
                                                  style: hMedium.copyWith(
                                                    color: cRed,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width <
                                                                600
                                                            ? 11
                                                            : 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.1.h,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 80.w,
                                                    child: Text(
                                                      ProductidController
                                                          .productBYid.name
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: hMedium.copyWith(
                                                        fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <
                                                                600
                                                            ? 11
                                                            : 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0.1.h,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 0.1.h,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 100.w,
                                                child: ListView.builder(
                                                  physics: PageScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: ProductidController
                                                      .productBYid
                                                      .attributes!
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                ProductidController
                                                                    .productBYid
                                                                    .attributes![
                                                                        index]
                                                                    .name
                                                                    .toString(),
                                                                style: hxMedium
                                                                    .copyWith(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      MediaQuery.of(context).size.width <
                                                                              600
                                                                          ? 11
                                                                          : 16,
                                                                )),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 42.w,
                                                              child: Text(
                                                                  ProductidController
                                                                      .productBYid
                                                                      .attributes![
                                                                          index]
                                                                      .options![
                                                                          0]
                                                                      .toString(),
                                                                  style: hsmall
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.blue)),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text("status",
                                                      style: hsmall.copyWith(
                                                          color: Colors.blue)),
                                                  SizedBox(
                                                    width: 33.w,
                                                  ),
                                                  Text(
                                                      ProductidController
                                                          .productBYid
                                                          .stockStatus
                                                          .toString(),
                                                      style: hsmall.copyWith(
                                                          color: appthem)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.favorite_border,
                                                color: cBlack,
                                              ),
                                              vSpacwidth10,
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              Text(
                                                "Product Add!",
                                                style: hsmall,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.refresh,
                                                color: cBlack,
                                              ),
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                              vSpacwidth10,
                                              Text(
                                                "Compare",
                                                style: hsmall,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Column(
                                      children: [
                                        if (ProductidController
                                                .productBYid.description !=
                                            '') ...[
                                          InkWell(
                                            onTap: () {
                                              descriptionButtomSheet(
                                                  context,
                                                  ProductidController
                                                      .productBYid.description
                                                      .toString());
                                            },
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: padA5,
                                                  child: Text(
                                                    "Description",
                                                    style: hsmall.copyWith(
                                                        color: cBlack,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ),
                                                Flexible(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height <
                                                                      600
                                                                  ? 12.h
                                                                  : 9.h,
                                                              width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width <
                                                                      600
                                                                  ? 50.w
                                                                  : 74.w,
                                                              child: Html(
                                                                data: ProductidController
                                                                    .productBYid
                                                                    .description,
                                                                style: {
                                                                  '#': Style(
                                                                    fontFamily:
                                                                        nexabook,
                                                                    fontSize:
                                                                        FontSize(
                                                                      MediaQuery.of(context).size.width <
                                                                              600
                                                                          ? 10.5
                                                                              .sp
                                                                          : 6.sp,
                                                                    ),
                                                                    maxLines: 3,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                },
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Icon(
                                                          Icons.arrow_forward,
                                                          size: 19,
                                                          color: cBlack
                                                              .withOpacity(0.9),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ))
                                              ],
                                            ),
                                          ),
                                        ] else ...[
                                          Text(""),
                                        ],
                                        const Divider(),
                                        InkWell(
                                          onTap: () {
                                            reviewButtomSheet(context);
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: padA5,
                                                child: Text(
                                                  "Review",
                                                  style: hsmall.copyWith(
                                                      color: cBlack,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Flexible(
                                                  child: Padding(
                                                padding: padA5,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height <
                                                                  600
                                                              ? 9.h
                                                              : 9.h,
                                                          width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width <
                                                                  600
                                                              ? 50.w
                                                              : 56.w,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Add yourr review abot the products and show the details...",
                                                                maxLines: 3,
                                                                style: hsmall.copyWith(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    color:
                                                                        cBlack),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width <
                                                                  600
                                                              ? 10.5.sp
                                                              : 14.w,
                                                        ),
                                                        Icon(
                                                          Icons.arrow_forward,
                                                          size: 19,
                                                          color: cBlack
                                                              .withOpacity(0.9),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                        const Divider(),
                                        InkWell(
                                          onTap: () {
                                            specificationButtomSheet(context);
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: padA5,
                                                child: Text(
                                                  "Specification",
                                                  style: hsmall.copyWith(
                                                      color: cBlack,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ),
                                              Flexible(
                                                  child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <
                                                                600
                                                            ? 10.5.sp
                                                            : 4.w,
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height <
                                                                600
                                                            ? 10.5.sp
                                                            : 8.h,
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <
                                                                600
                                                            ? 50.w
                                                            : 60.w,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Express delivery We deliver in 2 to 4 business days Responsive customer service We have a responsive customer service available 7/7",
                                                              maxLines: 2,
                                                              style: hsmall.copyWith(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  color:
                                                                      cBlack),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward,
                                                        size: 19,
                                                        color: cBlack
                                                            .withOpacity(0.9),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                        const Divider(),
                                        InkWell(
                                          onTap: () {
                                            faqButtomSheet(context);
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: padA5,
                                                child: Text(
                                                  "FAQ'S",
                                                  style: hsmall.copyWith(
                                                      color: cBlack,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 11.w,
                                              ),
                                              Flexible(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 2, right: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height <
                                                                  600
                                                              ? 10.5.sp
                                                              : 9.h,
                                                          width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width <
                                                                  600
                                                              ? 50.w
                                                              : 60.w,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "In case of failure, the product is repaired free of charge. If the repair is not possible, Parts Can be replaced and you have to pay the price for Replaced Parts only. Labor & Servicing absolutely free for 1 year.",
                                                                maxLines: 2,
                                                                style: hsmall.copyWith(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    color:
                                                                        cBlack),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.arrow_forward,
                                                          size: 19,
                                                          color: cBlack
                                                              .withOpacity(0.9),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                        const Divider(),
                                        InkWell(
                                          onTap: () {
                                            faqButtomSheet(context);
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Container(
                                                  width: 25.w,
                                                  child: Text(
                                                    "Our Gauarantee to you",
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: hsmall.copyWith(
                                                        color: cBlack,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height <
                                                                  600
                                                              ? 10.5.sp
                                                              : 9.h,
                                                          width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width <
                                                                  600
                                                              ? 50.w
                                                              : 60.w,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "In case of failure, the product is repaired free of charge. If the repair is not possible, Parts Can be replaced and you have to pay the price for Replaced Parts only. Labor & Servicing absolutely free for 1 year.",
                                                                maxLines: 2,
                                                                style: hsmall.copyWith(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    color:
                                                                        cBlack),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.arrow_forward,
                                                          size: 19,
                                                          color: cBlack
                                                              .withOpacity(0.9),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 8, bottom: 8),
                                        child: Text(
                                          "Related products?",
                                          style: hMedium.copyWith(
                                              fontSize: 18, color: cBlack),
                                        ),
                                      ),
                                    ],
                                  ),
                                  LaptopListViewProductComponent(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100.w,
                          color: colorWhite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${"AED "' '+ ProductidController.productBYid.regularPrice.toString()}",
                                        style: hMedium.copyWith(
                                          color: cGrey,
                                          fontSize: 16,
                                          decoration:
                                          TextDecoration.lineThrough,
                                        )),
                                    Text(
                                        "${"AED "' '+ProductidController.productBYid.salePrice.toString()}",
                                        style: hsmall.copyWith(
                                          fontSize: 20,
                                            color: cBlack.withOpacity(0.8)),),

                                  ],
                                ),
                              ),
                              Obx(() {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: addToCartController.buttonText.value ==
                                          "Add to Cart"
                                      ?  ProductidController.productLoadbutton.value? CircularProgressIndicator():RoundedButton(
                                    borderRadius: 12,
                                    height: 6.h,
                                    width: 50.w,
                                    backGroundColor: appthem,
                                    textButton: "Add to Cart",
                                    onTap: () async {
                                      totalAmoutController.totalAmountToCart();
                                      await addToCartController.addToCart(
                                        ProductidController.productBYid.id
                                            .toString(),
                                        1.toString(),
                                      );
                                    },
                                  )
                                      : Column(
                                        children: [

                                          RoundedButton(
                                              borderRadius: 12,
                                              height: 6.h,
                                              width: 50.w,
                                              backGroundColor: Colors.red,
                                              textButton: "Check out",
                                              onTap: () {
                                                // print(totalAmoutController.totalAmountModel.totals!.shippingTotal.);
                                                Get.to(() => AddToCart(

                                                  // price: ProductidController
                                                  //   .productBYid.salePrice
                                                  //   .toString(),
                                                  // shopping: totalAmoutController
                                                  //     .totalAmountModel
                                                  //     .totals!
                                                  //     .shippingTotal,
                                                  // totalAmount: totalAmoutController
                                                  //     .totalAmountModel
                                                  //     .totals!
                                                  //     .total.toString(),


                                                ));
                                                totalAmoutController.totalAmountToCart();



                                                

                                              },
                                            ),
                                        ],
                                      ),
                                );
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
        ));
  }

  Widget normalText(
      {String? textBold,
      double? size,
      String? noramlBold,
      double? normalSize}) {
    return Column(
      children: [
        SizedBox(
          height: 0.5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              textBold!,
              style: hMedium.copyWith(color: cBlack, fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                noramlBold!,
                style: hsmall,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // void servicesButtomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Container(
  //         height: 61.h,
  //         // Customize the appearance of the bottom sheet
  //         color: cGrey.withOpacity(0.3),
  //         child: Column(
  //           children: [
  //             Card(
  //               child: ListTile(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                 },
  //                 leading: Text("Services"),
  //                 trailing: Icon(Icons.close),
  //               ),
  //             ),
  //             SingleChildScrollView(
  //               child: Column(
  //                 children: [
  //                   Card(
  //                     child: ExpansionTile(
  //                       trailing: Icon(Icons.add),
  //                       title: Text(
  //                         "Services",
  //                         style: hMedium.copyWith(color: cBlack, fontSize: 15),
  //                       ),
  //                       children: [OurGauarantee()],
  //                     ),
  //                   ),
  //
  //                   // Add more options as needed
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // void specificationButtomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Container(
  //         height: 61.h,
  //         // Customize the appearance of the bottom sheet
  //         color: cGrey.withOpacity(0.3),
  //         child: Column(
  //           children: [
  //             Card(
  //               child: ListTile(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                 },
  //                 leading: Text("Services"),
  //                 trailing: Icon(Icons.close),
  //               ),
  //             ),
  //             SingleChildScrollView(
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: padA1.add(EdgeInsets.only(bottom: 10)),
  //                     child: Row(
  //                       children: [
  //                         Column(
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               "Brand",
  //                               style: hMedium.copyWith(
  //                                   color: cBlack, fontSize: 13),
  //                             ),
  //                             SizedBox(
  //                               height: 0.5.h,
  //                             ),
  //                             Text(
  //                               "Model",
  //                               style: hMedium.copyWith(
  //                                   color: cBlack, fontSize: 13),
  //                             ),
  //                             SizedBox(
  //                               height: 0.5.h,
  //                             ),
  //                             Text(
  //                               "CPU Model",
  //                               style: hMedium.copyWith(
  //                                   color: cBlack, fontSize: 13),
  //                             ),
  //                             SizedBox(
  //                               height: 0.5.h,
  //                             ),
  //                             Text(
  //                               "Hard Disk Size",
  //                               style: hMedium.copyWith(
  //                                   color: cBlack, fontSize: 13),
  //                             ),
  //                             Text(
  //                               "Memory",
  //                               style: hMedium.copyWith(
  //                                   color: cBlack, fontSize: 13),
  //                             ),
  //                             SizedBox(
  //                               height: 0.5.h,
  //                             ),
  //                             Text(
  //                               "Screen Size",
  //                               style: hMedium.copyWith(
  //                                   color: cBlack, fontSize: 13),
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(
  //                           width: 8.w,
  //                         ),
  //                         Column(
  //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               "HP",
  //                               style: hsmall.copyWith(fontSize: 13),
  //                             ),
  //                             SizedBox(
  //                               height: 0.5.h,
  //                             ),
  //                             Text(
  //                               "HP Chrome Book x360 11",
  //                               style: hsmall.copyWith(fontSize: 13),
  //                             ),
  //                             SizedBox(
  //                               height: 0.5.h,
  //                             ),
  //                             Text(
  //                               "Intel Family",
  //                               style: hsmall.copyWith(fontSize: 13),
  //                             ),
  //                             SizedBox(
  //                               height: 0.5.h,
  //                             ),
  //                             Text(
  //                               "16GB SSD",
  //                               style: hsmall.copyWith(fontSize: 13),
  //                             ),
  //                             SizedBox(
  //                               height: 0.5.h,
  //                             ),
  //                             Text(
  //                               "2GB",
  //                               style: hsmall.copyWith(fontSize: 13),
  //                             ),
  //                             Text(
  //                               "12-Inches",
  //                               style: hsmall.copyWith(fontSize: 13),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //
  //                   // Add more options as needed
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  void faqButtomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 75.h,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text(
                    "Our Gauarantee To You",
                    style: hMedium.copyWith(color: cBlack, fontSize: 13.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: const Icon(Icons.close),
                ),
              ),
              const Divider(),
              SizedBox(
                height: 63.h,
                // Customize the appearance of the bottom sheet
                // color: cGrey.withOpacity(0.3),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: padA5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: padA5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    normalText(
                                        textBold: "1 year warranty ",
                                        size: 12,
                                        noramlBold:
                                            "In case of failure, the product is repaired free of charge. If the repair is not possible, Parts Can be replaced and you have to pay the price for Replaced Parts only. Labor & Servicing absolutely free for 1 year."),
                                    normalText(
                                        textBold:
                                            "30 days Contractual Warranty",
                                        size: 12,
                                        noramlBold:
                                            "In case of failure, the product is repaired free of charge. If the repair is not possible the product is exchanged, no Question asked."),
                                    // Add more options as needed
                                  ],
                                ),
                              ),
                              Padding(
                                padding: padA5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    normalText(
                                        textBold: "15 days to change your mind",
                                        size: 12,
                                        noramlBold:
                                            "You have 15 days after receiving the product to use it. If it does not meet your expectations, we will refund you as soon as possible."),

                                    normalText(
                                        textBold: "Express delivery",
                                        size: 12,
                                        noramlBold:
                                            "We deliver in 2 to 4 business days."),

                                    // Add more options as needed
                                  ],
                                ),
                              ),
                              Padding(
                                padding: padA5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    normalText(
                                        textBold: "Responsive customer service",
                                        size: 12,
                                        noramlBold:
                                            "We have a responsive customer service available 7/7 and we are committed to responding within one business day if you have any question of problem."),
                                    normalText(
                                        textBold: "Secure Payment",
                                        size: 12,
                                        noramlBold:
                                            "We accept online payments by credit and debit cards in addition to cash on delivery."),

                                    // Add more options as needed
                                  ],
                                ),
                              ),

                              // Add more options as needed
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void specificationButtomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 75.h,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text(
                    "Specification",
                    style: hMedium.copyWith(color: cBlack, fontSize: 13.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: const Icon(Icons.close),
                ),
              ),
              const Divider(),
              SizedBox(
                height: 63.h,
                // Customize the appearance of the bottom sheet
                // color: cGrey.withOpacity(0.3),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: padA5,
                              child: Html(
                                  data: ProductidController
                                      .productBYid.shortDescription
                                      .toString()),
                            ),
                          ),
                        ],
                      ),

                      // Add more options as needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void servicesButtomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 75.h,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text(
                    "Services",
                    style: hMedium.copyWith(color: cBlack, fontSize: 13.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: const Icon(Icons.close),
                ),
              ),
              const Divider(),
              SizedBox(
                height: 63.h,
                // Customize the appearance of the bottom sheet
                // color: cGrey.withOpacity(0.3),
                child: SingleChildScrollView(
                  child: Column(
                    children: const [OurGauarantee()],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void reviewButtomSheet(BuildContext context) {
    final s = MediaQuery.of(context).size;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 75.h,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text(
                    "Your Review",
                    style: hMedium.copyWith(color: cBlack, fontSize: 13.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: const Icon(Icons.close),
                ),
              ),
              const Divider(),
              SizedBox(
                height: 63.h,
                // Customize the appearance of the bottom sheet
                // color: cGrey.withOpacity(0.3),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _formKey,
                        child: Padding(
                          padding: padA5,
                          child: Column(
                            children: [
                              Text("Get in Touch",
                                  style: hMediumX.copyWith(fontSize: 28)),
                              SizedBox(
                                height: s.height * 0.04,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  width: s.width * 0.75,
                                  ImageAssests.contactImage,
                                ),
                              ),
                              SizedBox(
                                height: s.height * 0.04,
                              ),
                              textwidget(text: "Name", textSing: "*"),
                              SizedBox(
                                height: s.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: RoundTextFormField(
                                    borderRadius: 4,
                                    ontapborderRadius: 4,
                                    obsecure: false,
                                    onValidate: (val) {
                                      if (val!.isEmpty) {
                                        return "This field is required.";
                                      }
                                    },
                                    hinttext: "First Name",
                                    controller: firstNameController,
                                  )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: RoundTextFormField(
                                      borderRadius: 4,
                                      ontapborderRadius: 4,
                                      obsecure: false,
                                      onValidate: (val) {
                                        if (val!.isEmpty) {
                                          return "This field is required.";
                                        }
                                      },
                                      hinttext: "Last Name",
                                      controller: lastNameController,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: s.height * 0.02,
                              ),
                              textwidget(text: "Email", textSing: "*"),
                              SizedBox(
                                height: s.height * 0.02,
                              ),
                              RoundTextFormField(
                                borderRadius: 4,
                                ontapborderRadius: 4,
                                obsecure: false,
                                onValidate: Constants.emailValidator,
                                controller: emailController,
                                hinttext: "Enter Your Email Address",
                              ),
                              SizedBox(
                                height: s.height * 0.02,
                              ),
                              textwidget(
                                  text: "Comment or Message", textSing: "*"),
                              SizedBox(
                                height: s.height * 0.02,
                              ),
                              RoundTextFormField(
                                borderRadius: 4,
                                ontapborderRadius: 4,
                                obsecure: false,
                                onValidate: (val) {
                                  if (val!.isEmpty) {
                                    return "This field is required.";
                                  }
                                },
                                maxLint: 6,
                                controller: commentNameController,
                              ),
                              RoundedButton(
                                borderRadius: 4,
                                backGroundColor: appthem,
                                textButton: 'Add Review',
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    print("success");
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void descriptionButtomSheet(BuildContext context, String Description) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 75.h,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text(
                    "Description",
                    style: hMedium.copyWith(color: cBlack, fontSize: 13.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: const Icon(Icons.close),
                ),
              ),
              const Divider(),
              SizedBox(
                height: 63.h,
                // Customize the appearance of the bottom sheet
                // color: cGrey.withOpacity(0.3),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: padA5,
                              child: Html(data: Description),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: padA5,
                              child: Html(
                                  data: ProductidController
                                      .productBYid.shortDescription
                                      .toString()),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget textwidget({text, textSing}) {
    return Padding(
      padding: padA5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
          ),
          Text(
            textSing,
            style: TextStyle(color: cRed),
          )
        ],
      ),
    );
  }
}
