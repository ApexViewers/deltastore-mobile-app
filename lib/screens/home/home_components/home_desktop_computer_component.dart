import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/loading/ShimmerEffectloading.dart';
import '../../../constant/paddings.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/all_categories_controller/all_categories_show_controller.dart';
import '../../../data/Controllers/dell_home_controller/dell_home_controller.dart';
import '../../../data/Controllers/destop_computer_controller/desktop_computer_controller.dart';
import '../../../data/Controllers/hp_home_controller/hp_home_controller.dart';
import '../../../data/Controllers/product_by_id_controller/product_by_id_controller.dart';
import '../../desktop_computer/component/desktop_computer_listview_component.dart';
import '../../laptops/views/hp/hp_details.dart';

class DeskTopComputerComponent extends StatefulWidget {
  const DeskTopComputerComponent({Key? key}) : super(key: key);

  @override
  State<DeskTopComputerComponent> createState() =>
      _DeskTopComputerComponentState();
}

class _DeskTopComputerComponentState extends State<DeskTopComputerComponent> {
  List<Widget> pages = [const DesktopComputerListComponent()];

  int selectedIndex = 0;
  bool index0=true;
  bool index1=false;
  bool index2=false;

  var showAllCategoryByIdController = Get.put(ShowAllCategoryByIdController());

  var desktopcomputerController = Get.put(DesktopComputerDataController());

  var ProductidController = Get.put((ProductIdController()));
  var dellHomeController = Get.put((DellHomeController()));
  var hpHomeController = Get.put((HpHomeController()));
  Color containerColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37.h,
      color: cGrey.withOpacity(0.1),
      child: Obx(() => desktopcomputerController.desktopComputerLoading.value
          ? const ShimmerEffectLoading()
          : desktopcomputerController.desktopComputerError.value != ''
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          desktopcomputerController.HpCategoriesController();
                          // setState(() {
                          //   desktopcomputerController.HpCategoriesController();
                          // });
                        },
                        icon: const Icon(Icons.refresh)),
                    Text(desktopcomputerController.desktopComputerError.value),
                  ],
                ))
              : Column(
                  children: [
                    SizedBox(
                      height: 6.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 2.w),
                          itemCount: desktopcomputerController
                              .desktopComputerModel.length,
                          itemBuilder: (context, index) {
                            final isSelected = selectedIndex == index;
                            final isDeleted445 = index == 454;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: containerColor,
                                        borderRadius:
                                            BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    selectedIndex = index;
                                                    if(selectedIndex==0){

                                                      setState(() {
                                                        index0=true;
                                                        index1=false;
                                                        index2=false;
                                                        index0==true?    containerColor=Colors.white:containerColor;


                                                      });

                                                    }
                                                    if(selectedIndex==1){

                                                      setState(() {
                                                        index0=false;
                                                        index1=true;
                                                        index2=false;
                                                        index1==true?   containerColor=Colors.red:containerColor;


                                                      });

                                                    }
                                                    if(selectedIndex==2){

                                                      setState(() {
                                                        index0=false;
                                                        index1=false;
                                                        index2=true;
                                                        index2==true?    containerColor=Colors.red:containerColor;


                                                      });

                                                    }

                                                  });


                                                },

                                              child: Text(desktopcomputerController
                                                  .desktopComputerModel[index].name.toString())),
                                        ],
                                      ),
                                    )),

                                ]

                            );
                          }),
                    ),
                   Visibility(
                        visible: index0,
                       child:Column(
                         children: [
                           Container(
                           height: 31.h,
                           color: cGrey.withOpacity(0.1),
                           child:
                           Obx(
                                 () => dellHomeController.hpcategoriesLoading.value
                                 ? const ShimmerEffectLoading()
                                 : dellHomeController.hpcategoriesError.value != ''
                                 ? Center(
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     IconButton(
                                         onPressed: () {
                                           dellHomeController.DellCategoriesController();
                                         },
                                         icon: const Icon(Icons.refresh)),
                                     Text( dellHomeController.hpcategoriesError.value),
                                   ],
                                 ))
                                 :
                             ListView.builder(
                               scrollDirection: Axis.horizontal,
                               itemCount:  dellHomeController.dellhomeModel.length,
                               // Replace with your actual item count
                               itemBuilder: (BuildContext context, int index) {

                                 // Replace with your item widget
                                 return InkWell(
                                   onTap: () {
                                     ProductidController.productById(
                                         dellHomeController.dellhomeModel[index].id!);
                                     Get.to(() => HpLaptopDetailsScreen());
                                   },
                                   child: Card(
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Row(
                                           mainAxisAlignment:
                                           MainAxisAlignment.spaceBetween,
                                           children: [
                                             const Text(""),
                                             SizedBox(
                                               width: 33.w,
                                             ),
                                             Padding(
                                               padding: padA5,
                                               child: Container(
                                                   decoration: BoxDecoration(
                                                       color: cGrey,
                                                       borderRadius:
                                                       BorderRadius.circular(30)),
                                                   width: 30,
                                                   height: 30,
                                                   child: const Icon(
                                                     Icons.favorite_border,
                                                     size: 16,
                                                     color: colorWhite,
                                                   )),
                                             ),
                                           ],
                                         ),
                                         Padding(
                                           padding: EdgeInsets.only(left: 6.w, bottom: 10),
                                           child: Container(
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(8)),
                                               height: 12.h,
                                               width: 29.w,
                                               child: Center(
                                                   child:  dellHomeController.dellhomeModel[index].images![0].src!.isEmpty
                                                       ? Container(
                                                       child: const Text(""))
                                                       : Image.network(
                                                       fit: BoxFit.cover,
                                                       dellHomeController.dellhomeModel[index].images![0].src
                                                           .toString()))),
                                         ),
                                         Padding(
                                           padding:
                                           const EdgeInsets.only(left: 7, bottom: 4),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Column(
                                                 mainAxisAlignment:
                                                 MainAxisAlignment.start,
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment.start,
                                                 children: [
                                                   Row(
                                                     mainAxisAlignment:
                                                     MainAxisAlignment.start,
                                                     crossAxisAlignment:
                                                     CrossAxisAlignment.start,
                                                     children: [
                                                       SizedBox(
                                                         width: 40.w,
                                                         child: Text(
                                                           dellHomeController.dellhomeModel[index].name
                                                               .toString(),
                                                           maxLines: 2,
                                                           style: hMedium.copyWith(
                                                               overflow:
                                                               TextOverflow.ellipsis,
                                                               fontSize: 11.sp,
                                                               color: cBlack
                                                                   .withOpacity(0.9)),
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                   const SizedBox(
                                                     height: 4.0,
                                                   ),
                                                   Text(
                                                       "AED ${dellHomeController.dellhomeModel[index]
                                                               .salePrice}" ==
                                                           ""
                                                           ? ""
                                                           : "AED ${dellHomeController.dellhomeModel[index]
                                                               .salePrice}",
                                                       style: hsmall.copyWith(
                                                           fontSize: 10.sp,
                                                           color:
                                                           cBlack.withOpacity(0.6))),
                                                   Text(
                                                     "AED ${dellHomeController.dellhomeModel[index]
                                                             .regularPrice}"
                                                         !=""?  dellHomeController.dellhomeModel[index]
                                                         .regularPrice
                                                         .toString():"",
                                                     style: hsmall.copyWith(
                                                         fontSize: 10.sp,
                                                         decoration:
                                                         TextDecoration.lineThrough,
                                                         color: cGrey.withOpacity(0.6)),
                                                   ),
                                                 ],
                                               ),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 );
                               },
                             ),
                             // ),
                           )


                       ),
                         ],
                       )


                   ),
                   Visibility(
                        visible: index1,
                       child:Column(
                         children: [
                           Container(
                               height: 31.h,
                               color: cGrey.withOpacity(0.1),
                               child:
                               Obx(
                                     () => hpHomeController.hpcategoriesLoading.value
                                     ? const ShimmerEffectLoading()
                                     : hpHomeController.hpcategoriesError.value != ''
                                     ? Center(
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         IconButton(
                                             onPressed: () {
                                               hpHomeController.HpCategoriesController();
                                             },
                                             icon: const Icon(Icons.refresh)),
                                         Text( hpHomeController.hpcategoriesError.value),
                                       ],
                                     ))
                                     :
                                 ListView.builder(
                                   scrollDirection: Axis.horizontal,
                                   itemCount: hpHomeController.hphomeModel.length,
                                   // Replace with your actual item count
                                   itemBuilder: (BuildContext context, int index) {

                                     // Replace with your item widget
                                     return InkWell(
                                       onTap: () {
                                         ProductidController.productById(
                                             hpHomeController.hphomeModel[index].id!);
                                         Get.to(() => HpLaptopDetailsScreen());
                                       },
                                       child: Card(
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Row(
                                               mainAxisAlignment:
                                               MainAxisAlignment.spaceBetween,
                                               children: [
                                                 const Text(""),
                                                 SizedBox(
                                                   width: 33.w,
                                                 ),
                                                 Padding(
                                                   padding: padA5,
                                                   child: Container(
                                                       decoration: BoxDecoration(
                                                           color: cGrey,
                                                           borderRadius:
                                                           BorderRadius.circular(30)),
                                                       width: 30,
                                                       height: 30,
                                                       child: const Icon(
                                                         Icons.favorite_border,
                                                         size: 16,
                                                         color: colorWhite,
                                                       )),
                                                 ),
                                               ],
                                             ),
                                             Padding(
                                               padding: EdgeInsets.only(left: 6.w, bottom: 10),
                                               child: Container(
                                                   decoration: BoxDecoration(
                                                       borderRadius: BorderRadius.circular(8)),
                                                   height: 12.h,
                                                   width: 29.w,
                                                   child: Center(
                                                       child:   hpHomeController.hphomeModel[index].images![0].src!.isEmpty
                                                           ? Container(
                                                           child: const Text(""))
                                                           : Image.network(
                                                           fit: BoxFit.cover,
                                                           hpHomeController.hphomeModel[index].images![0].src
                                                               .toString()))),
                                             ),
                                             Padding(
                                               padding:
                                               const EdgeInsets.only(left: 7, bottom: 4),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.start,
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   Column(
                                                     mainAxisAlignment:
                                                     MainAxisAlignment.start,
                                                     crossAxisAlignment:
                                                     CrossAxisAlignment.start,
                                                     children: [
                                                       Row(
                                                         mainAxisAlignment:
                                                         MainAxisAlignment.start,
                                                         crossAxisAlignment:
                                                         CrossAxisAlignment.start,
                                                         children: [
                                                           SizedBox(
                                                             width: 40.w,
                                                             child: Text(
                                                               hpHomeController.hphomeModel[index].name
                                                                   .toString(),
                                                               maxLines: 2,
                                                               style: hMedium.copyWith(
                                                                   overflow:
                                                                   TextOverflow.ellipsis,
                                                                   fontSize: 11.sp,
                                                                   color: cBlack
                                                                       .withOpacity(0.9)),
                                                             ),
                                                           ),
                                                         ],
                                                       ),
                                                       const SizedBox(
                                                         height: 4.0,
                                                       ),
                                                       Text(
                                                           "AED ${hpHomeController.hphomeModel[index]
                                                                   .salePrice}" ==
                                                               ""
                                                               ? ""
                                                               : "AED ${hpHomeController.hphomeModel[index]
                                                                   .salePrice}",
                                                           style: hsmall.copyWith(
                                                               fontSize: 10.sp,
                                                               color:
                                                               cBlack.withOpacity(0.6))),
                                                       Text(
                                                         "AED ${hpHomeController.hphomeModel[index]
                                                                 .regularPrice}"
                                                             !=""?  hpHomeController.hphomeModel[index]
                                                             .regularPrice
                                                             .toString():"",
                                                         style: hsmall.copyWith(
                                                             fontSize: 10.sp,
                                                             decoration:
                                                             TextDecoration.lineThrough,
                                                             color: cGrey.withOpacity(0.6)),
                                                       ),
                                                     ],
                                                   ),
                                                 ],
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     );
                                   },
                                 ),
                                 // ),
                               )


                           ),
                         ],
                       ) ),
                   Visibility(
                        visible: index2,
                       child:const Text("no data available") ),

                  ],
                )),
    );
  }
  

}
