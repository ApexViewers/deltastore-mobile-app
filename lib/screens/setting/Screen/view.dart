
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/screens/setting/Screen/privacy_policy/privacy_policy_view.dart';
import 'package:test_app/screens/setting/Screen/return_policy/view.dart';
import 'package:test_app/screens/setting/Screen/setting_screen.dart';

import '../../../constant/image_assets.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import 'delivery_shipment_policy/view.dart';
import '../../../data/Controllers/login_account_controller/login_account_controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var loginController = Get.put(LoginAccountController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorWhite,
        title: SizedBox(
          width: 70.w,
          child: Image.asset(
            ImageAssests.logoImge.toString(),
            fit: BoxFit.cover,
          ),
        ),
        flexibleSpace: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Get.to(() => const ListOfSettingItem());
              // Handle settings icon pressed
            },
          ),
        ),
      ),
      body: FutureBuilder(
        future: loginController.retrieveUsername(),
        builder: (ctx, snapshot){
          if(snapshot.hasData){
            String username = snapshot.data![0];
            String email = snapshot.data![1];
            return Padding(
              padding: const EdgeInsets.only(
                left: 5,
                top: 5,
                right: 5,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  username,
                                  style: hMedium.copyWith(fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: cGrey,
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.copy_outlined,
                                            size: 13,
                                          ),
                                          const SizedBox(
                                            width: 9,
                                          ),
                                          Text(
                                            "AED 0.00",
                                            style: hsmall.copyWith(fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  email,
                                  style: hsmall.copyWith(fontSize: 12),
                                ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      "Verify now",
                                      style: hsmall.copyWith(
                                          fontSize: 9, color: appthem),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(children: [
                            InkWell(
                                onTap: () {
                                  Get.to(() => const DeliveryAndShipment());
                                },
                                child: containerbox(
                                    Icons.local_convenience_store_outlined,
                                    "Shipment Policy")),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(() => const ReturnPolicy());
                                },
                                child: containerbox(
                                    Icons.local_convenience_store_outlined,
                                    "Return Policy")),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(() => const PrivacyPolicy());
                                },
                                child: containerbox(
                                    Icons.location_on_outlined, "Privacy Policy")),
                          ]),
                        )),
                    // Card(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Container(
                    //         color: cGrey,
                    //         child: Column(
                    //           children: [
                    //             Icon(Icons.delivery_dining),
                    //             Text("data"),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         child: Column(
                    //           children: [
                    //             Icon(Icons.delivery_dining),
                    //             Text("data"),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         child: Column(
                    //           children: [
                    //             Icon(Icons.delivery_dining),
                    //             Text("data"),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         child: Column(
                    //           children: [
                    //             Icon(Icons.delivery_dining),
                    //             Text("data"),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         child: Column(
                    //           children: [
                    //             Icon(Icons.delivery_dining),
                    //             Text("data"),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )

                    Card(
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        margin: EdgeInsets.all(25.sp),
                        decoration: BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              // margin: EdgeInsets.symmetric(vertical: 3.5.h),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: cGrey.withOpacity(0.1)),
                              child: Padding(
                                padding: EdgeInsets.all(34.sp),
                                child: Image.asset(
                                  ImageAssests.nodatafound,
                                  height: 10.h,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'No Data Found',
                              style: hMediumX.copyWith(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          else if(snapshot.hasError){
            return const Text("Not logged in");
          }
          else{
            return const Center(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  containerbox(icon, text) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(8)),
      height: 69.sp,
      width: 69.sp,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: cBlack.withOpacity(0.5),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: hMedium.copyWith(fontSize: 8.sp, color: cBlack),
            )
          ],
        ),
      ),
    );
  }
}
