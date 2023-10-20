import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/screens/laptops/components/empty_cart_container.dart';

import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/cart_controller/cart_controller.dart';
import '../../../reuseable_widgets/appbar_widget.dart';
import '../../home/view/home.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartView({super.key});

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
        body: FutureBuilder(
          future: cartController.fetchCartData(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              bool received = snapshot.data!;
              if (received) {
                return Obx(
                  () {
                    if (cartController.cartData.value.items.isEmpty) {
                      return EmptyCartContainer.showAppBar(showAppBar: false);
                    } else {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                        child: ListView.builder(
                          itemCount:
                              cartController.cartData.value.items.length,
                          itemBuilder: (context, index) {
                            final item =
                                cartController.cartData.value.items[index];
                            return ListTile(
                              leading: item.featuredImage != null
                                  ? Image.network(item.featuredImage,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover, errorBuilder:
                                          (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                      return const Icon(Icons.image);
                                    })
                                  : const Icon(Icons
                                      .image), // Display default icon if image is not available
                              title: Text(item.name),
                              subtitle: Text('Price: ${item.price}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  // Implement delete functionality here
                                },
                              ),
                            );
                          },
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO: Implement Checkout Functionality
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
