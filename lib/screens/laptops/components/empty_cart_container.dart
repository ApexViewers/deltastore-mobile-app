import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/constant/styles/colors.dart';
import 'package:test_app/screens/allorder/view/allorder.dart';
import 'package:test_app/screens/home/components/nav_bar_component.dart';

import '../../../constant/image_assets.dart';
import '../../../data/Controllers/cart_controller/cart_controller.dart';
import '../../../data/Controllers/items_in_cart_controller/item_in_cart_controller.dart';
import '../../../data/Controllers/total_amount_cart_controller/total_amount_controller.dart';
import '../../home/view/home.dart';
import '../../setting/Screen/setting_screen.dart';

class EmptyCartContainer extends StatelessWidget {

  final CartController cartController = Get.put(CartController());
  var itemController = Get.put((ItemInCartController()));
  var totalAmoutController = Get.put(TotalAmountController());
  bool showAppBar = true;
  EmptyCartContainer({super.key});
  EmptyCartContainer.showAppBar({super.key, required this.showAppBar});

  // Future<void> refreshScreen() async {
  //   cartController.fetchCartData();
  //   itemController.fetchDataFromApi();
  //   totalAmoutController.totalAmountToCart();
  //   Get.snackbar('Refresh', 'Screen is Refreshing');
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: showAppBar?AppBar(
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
      ):null,
      body: WillPopScope(
          onWillPop: () async {
            Get.to(() =>  Bar());
            return true;
          },
        child: RefreshIndicator(
          onRefresh: () async {
            //await refreshScreen();
            Get.to(() => AllOrder());
          },
          child: ListView(
            children: [
              Container(
                height: Get.height*0.75,
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.fromLTRB(30, 230, 30, 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    const Text(
                      'It looks like your shopping cart is empty!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Don\'t worry, you can easily fix that by browsing through our top categories or adding from your wishlist.',textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 16
                    ),),
                    const SizedBox(
                      height: 18,
                    ),
                    CircleAvatar(
                      backgroundColor: backgroundColor,
                      radius: 50,
                      child: const Center(child: Icon(Icons.add_shopping_cart,size: 50,color: Colors.blueGrey,)),
                    ),
                    //TODO: Add Start Shopping Button
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(Bar());
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text('Start Shopping',style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
