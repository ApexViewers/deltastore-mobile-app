
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constant/paddings.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/logout_controller/logout_controller.dart';
import '../../contact/contect_us.dart';
import '../../contact_info/contact_info.dart';
import '../../visit_our_store/visit_our_store.dart';
import '../../warranty/warranty.dart';
import '../Screen/delivery_shipment_policy/view.dart';
import '../Screen/help/help_pages/view.dart';
import '../Screen/privacy_policy/privacy_policy_view.dart';
import '../Screen/return_policy/view.dart';
import '../../../data/Controllers/login_account_controller/login_account_controller.dart';

class ListComponent extends StatelessWidget {
  ListComponent({Key? key}) : super(key: key);
  var logoutController = Get.put(LogoutController);
  var loginController = Get.put(LoginAccountController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loginController.retrieveUsername(),
      builder: (ctx, snapshot){
        if(snapshot.hasData){
          List<String> userData = snapshot.data!;
          return Container(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: padA2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              userData[0],
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
                              userData[1],
                              style: hsmall.copyWith(fontSize: 12),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  "Verify now",
                                  style: hsmall.copyWith(fontSize: 9, color: appthem),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 9, top: 10, bottom: 10),
                      child: Text(
                        "Personal Information",
                        style: hsmall.copyWith(
                            color: cBlack.withOpacity(0.5), fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Card(
                  child: Padding(
                    padding: padA2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_outline_outlined,
                                    color: cBlack.withOpacity(0.5),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "name",
                                        style: hsmall.copyWith(
                                            color: cBlack.withOpacity(0.5)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        userData[0],
                                        style: hMedium.copyWith(
                                            fontSize: 14, color: cBlack),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Icon(
                                Icons.edit_outlined,
                                color: cBlack.withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: cGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    color: cBlack.withOpacity(0.5),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "email",
                                        style: hsmall.copyWith(
                                            color: cBlack.withOpacity(0.5)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        userData[1],
                                        style: hMedium.copyWith(
                                            fontSize: 14, color: cBlack),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: cGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: cBlack.withOpacity(0.5),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Location",
                                    style:
                                    hMedium.copyWith(fontSize: 14, color: cBlack),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 9, top: 10, bottom: 10),
                      child: Text(
                        "Reach out to us",
                        style: hsmall.copyWith(
                            color: cBlack.withOpacity(0.5), fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Card(
                  child: Padding(
                    padding: padA2,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const HelpPage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: cBlack.withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Help ",
                                      style: hMedium.copyWith(
                                          fontSize: 14, color: cBlack),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: cGrey,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const DeliveryAndShipment());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_convenience_store_outlined,
                                      color: cBlack.withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Delivery and Shipment Policy ",
                                      style: hMedium.copyWith(
                                          fontSize: 14, color: cBlack),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: cGrey,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => ContactInfo());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: cBlack.withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Contact Info",
                                      style: hMedium.copyWith(
                                          fontSize: 14, color: cBlack),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: cGrey,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const ReturnPolicy());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_convenience_store_outlined,
                                      color: cBlack.withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "return policy ",
                                      style: hMedium.copyWith(
                                          fontSize: 14, color: cBlack),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: cGrey,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const PrivacyPolicy());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: cBlack.withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Privacy Policy ",
                                      style: hMedium.copyWith(
                                          fontSize: 14, color: cBlack),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: cGrey,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const VisitOurStore());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.home_filled,
                                      color: cBlack.withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Visit our Store",
                                      style: hMedium.copyWith(
                                          fontSize: 14, color: cBlack),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: cGrey,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const ContactUs());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: cBlack.withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Contact us",
                                      style: hMedium.copyWith(
                                          fontSize: 14, color: cBlack),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: cGrey,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const Warranty());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_atm_rounded,
                                      color: cBlack.withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Warranty",
                                      style: hMedium.copyWith(
                                          fontSize: 14, color: cBlack),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: cGrey,
                        ),
                        InkWell(
                          onTap: () {
                            LogoutController().logout();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: cBlack.withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "SignOut",
                                      style: hMedium.copyWith(
                                          fontSize: 14, color: cBlack),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
