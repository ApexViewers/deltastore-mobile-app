import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Searchpage/search.dart';

import '../../../constant/image_assets.dart';
import '../../../constant/paddings.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/Categories_controller/all_categories_controller.dart';
import '../../../data/Controllers/all_categories_controller/all_categories_show_controller.dart';

import '../../../data/Controllers/dell_laptop_controller/dell_laptop_controller.dart';
import '../../../data/Controllers/destop_computer_controller/desktop_computer_controller.dart';
import '../../../data/Controllers/twoinone_category_controller/twoinone_category_controller.dart';
import '../../../reuseable_widgets/rounded_textfield.dart';
import '../../desktop_computer/component/desktop_computer_listview_component.dart';
import '../../laptops/components/hp_laptop_component/laptop_listview_products_component.dart';
import '../../laptops/components/laptop_grid_view_product_component.dart';
import '../../laptops/components/laptop_listview_products_component.dart';
import '../../laptops/views/hp/hp_laptop.dart';
import '../../setting/Screen/delivery_shipment_policy/view.dart';
import '../../setting/Screen/return_policy/view.dart';
import '../components/my_image_slider.dart';
import '../components/top_bar_component.dart';
import '../home_components/home_dell_component.dart';
import '../home_components/home_desktop_computer_component.dart';
import '../home_components/home_hp_component.dart';
import '../home_components/home_lenovo_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a delay in loading the image
  }

  var dellLaptopController = Get.put(DellCategoriesListController());
  TextEditingController searchController = TextEditingController();
  final scrollController = ScrollController();
  var showAllCategoryByIdController = Get.put(ShowAllCategoryByIdController());
  var allCatagoriesController = Get.put(AllCategoriesListController());
  var twoInOneCategoriesController = Get.put(TwoInOneCategoriesController());
  var desktopComputerController = Get.put(DesktopComputerDataController());

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Colors.blue;
    // Initial button color
    // var homeScreenController = Get.find<HomeScreenController>();
    return Scaffold(
      backgroundColor: cGrey.withOpacity(0.1),
      key: scaffoldKey,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: colorWhite,
                  statusBarIconBrightness: Brightness.dark,
                ),
                expandedHeight: 127,
                floating: true,
                pinned: true,
                backgroundColor: colorWhite,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const TopBarComponent(),
                          const SizedBox(height: 8),
                          // Add spacing between TopBarComponent and TextField
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: ReuseTextField(
                              onTap: () {
                                Get.to(() => Search(),
                                    transition: Transition.cupertino);
                              },
                              onChanged: (val) {},
                              fontSize: 12,
                              height: 5.6.h,
                              borderRadius: 4,
                              width: 89.w,
                              hinttext: "What are you looking for ?",
                              hintTextColor: cBlack.withOpacity(0.4),
                              ontapborderRadius: 4,
                              fill: true,
                              fillcolor: cGrey.withOpacity(0.2),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(right: 6, left: 4),
                                child: Icon(
                                  Icons.search_sharp,
                                  size: 18,
                                  color: cBlack.withOpacity(0.6),
                                ),
                              ),
                              controller: searchController,
                              obsecure: false,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )

              // Add other slivers or content here

              // Your SliverAppBar configuration...
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              color: cGrey.withOpacity(0.1),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          color: colorWhite, child: const MyImageSlider()),
                      // vSpac10,
                      Column(
                        children: [
                          Container(
                              width: 100.w,
                              height: 4.h,
                              color: appthem,
                              child: Center(
                                  child: Text(
                                "free delivery in order AED 25",
                                style: hsmall.copyWith(color: colorWhite),
                              ))),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          // Container(
                          //   child: Column(
                          //     children: [LaptopGridProductComponent()],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 9,
                          ),
                          Padding(
                            padding: sidepad,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: padA5,
                                      child: Row(
                                        children: [
                                          Text(
                                            "24 hours deals offers available",
                                            style: hMedium.copyWith(
                                                color: cBlack, fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        ImageAssests.cover1mge,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: padA5,
                                      child: Text(
                                        "Dell Laptop Deals",
                                        style: hMedium.copyWith(
                                            color: cBlack, fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Text(
                                              "See all",
                                              style: hsmall,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            Icons.arrow_forward,
                                            size: 12,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                DellLaptopProductComponent(),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: padA5,
                                      child: Text(
                                        "24 hours deals offers available",
                                        style: hMedium.copyWith(
                                            color: cBlack, fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "https://deltastore.ae/wp-content/uploads/2023/04/cover-1536x320.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: padA5,
                                          child: Text(
                                            "Hp Laptop Deals",
                                            style: hMedium.copyWith(
                                                color: cBlack, fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.w),
                                          child: Row(
                                            children: [
                                              Text(
                                                "See all",
                                                style: hsmall,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 12,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    HpLaptopProductComponent()
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //   children: [
                                //     ClipRRect(
                                //       borderRadius: BorderRadius.circular(12),
                                //       child: Container(
                                //         height: 60,
                                //         width: 60,
                                //         child: Image.network(
                                //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ5qmjHOwsN5iwBmtYF752Nng_7a9MMuYCWQ&usqp=CAU',
                                //           fit: BoxFit.cover,
                                //         ),
                                //       ),
                                //     ),
                                //     ClipRRect(
                                //       borderRadius: BorderRadius.circular(12),
                                //       child: Container(
                                //         height: 60,
                                //         width: 60,
                                //         decoration: BoxDecoration(
                                //             borderRadius: BorderRadius.circular(30)),
                                //         child: Image.network(
                                //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3mU46b5HZih8dW-wJlodJDYVd2ekBWzr8dA&usqp=CAU',
                                //           fit: BoxFit.cover,
                                //         ),
                                //       ),
                                //     ),
                                //     ClipRRect(
                                //       borderRadius: BorderRadius.circular(12),
                                //       child: Container(
                                //         height: 60,
                                //         width: 60,
                                //         decoration: BoxDecoration(
                                //             color: cRed,
                                //             borderRadius: BorderRadius.circular(30)),
                                //         child: Image.network(
                                //           'https://images.unsplash.com/photo-1580522154071-c6ca47a859ad?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGxhcHRvcHN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                                //           fit: BoxFit.cover,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //   children: [
                                //     Card(
                                //       child: Container(
                                //         decoration: BoxDecoration(
                                //             borderRadius:
                                //             BorderRadius.circular(
                                //                 8)),
                                //         height: 10.h,
                                //         width: 20.5.w,
                                //         child: Container(
                                //           decoration: BoxDecoration(),
                                //           margin: EdgeInsets.only(
                                //               left: 3.w,
                                //               right: 4.w,
                                //               bottom: 2.h,
                                //               top: 2.h),
                                //           child: Image.network(
                                //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ5qmjHOwsN5iwBmtYF752Nng_7a9MMuYCWQ&usqp=CAU',
                                //             fit: BoxFit.cover,
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     ClipRRect(
                                //       borderRadius: BorderRadius.circular(12),
                                //       child: Container(
                                //         height: 60,
                                //         width: 60,
                                //         child: Image.network(
                                //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ5qmjHOwsN5iwBmtYF752Nng_7a9MMuYCWQ&usqp=CAU',
                                //           fit: BoxFit.cover,
                                //         ),
                                //       ),
                                //     ),
                                //     ClipRRect(
                                //       borderRadius: BorderRadius.circular(12),
                                //       child: Container(
                                //         height: 60,
                                //         width: 60,
                                //         decoration: BoxDecoration(
                                //             borderRadius: BorderRadius.circular(30)),
                                //         child: Image.network(
                                //           'https://deltastore.ae/wp-content/uploads/2023/04/Dell-Latitude-7400.png',
                                //           fit: BoxFit.cover,
                                //         ),
                                //       ),
                                //     ),
                                //     ClipRRect(
                                //       borderRadius: BorderRadius.circular(5),
                                //       child: Container(
                                //         height: 60,
                                //         width: 60,
                                //
                                //         decoration: BoxDecoration(
                                //             color: colorWhite,
                                //             borderRadius: BorderRadius.circular(4)),
                                //         child: Padding(
                                //           padding: const EdgeInsets.all(8.0),
                                //           child: Image.network(
                                //             'https://images.unsplash.com/photo-1580522154071-c6ca47a859ad?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGxhcHRvcHN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                                //             fit: BoxFit.cover,
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(() =>
                                                const DeliveryAndShipment());
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10)),
                                            child: Image.asset(
                                              ImageAssests.freeshipping,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(() => const ReturnPolicy());
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                            child: Image.asset(
                                              ImageAssests.freereturn,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: padA5,
                                          child: Text(
                                            "Lenovo Laptop Deals",
                                            style: hMedium.copyWith(
                                                color: cBlack, fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.w),
                                          child: Row(
                                            children: [
                                              Text(
                                                "See all",
                                                style: hsmall,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 12,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    LenovoLaptopProductComponent()
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),

                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: padA5,
                                          child: Text(
                                            "Desktops Computers",
                                            style: hMedium.copyWith(
                                                color: cBlack, fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.w),
                                          child: Row(
                                            children: [
                                              Text(
                                                "See all",
                                                style: hsmall,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 12,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    DeskTopComputerComponent(),

                                    // Obx(() => Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    //   children: [
                                    //     ElevatedButton(
                                    //       onPressed: () {
                                    //         desktopComputerController.changecategoriesdata(1); // Change to Design 1
                                    //       },
                                    //       style: ElevatedButton.styleFrom(
                                    //         primary:    desktopComputerController.selectedDesign.value == 1
                                    //             ? Colors.blue // Change to blue if selected
                                    //             : null, // Null to use default color
                                    //       ),
                                    //       child: const Text('All'),
                                    //     ),
                                    //     ElevatedButton(
                                    //       onPressed: () {
                                    //         desktopComputerController.changecategoriesdata(2);// Change to Design 2
                                    //       },
                                    //       style: ElevatedButton.styleFrom(
                                    //         primary: desktopComputerController.selectedDesign.value == 2
                                    //             ? Colors.red // Change to red if selected
                                    //             : null, // Null to use default color
                                    //       ),
                                    //       child: const Text('Hp'),
                                    //     ),
                                    //     ElevatedButton(
                                    //       onPressed: () {
                                    //         desktopComputerController.changecategoriesdata(3);/// Change to Design 3
                                    //       },
                                    //       style: ElevatedButton.styleFrom(
                                    //         primary:   desktopComputerController.selectedDesign.value == 3
                                    //             ? Colors.green // Change to green if selected
                                    //             : Colors.white, // Null to use default color
                                    //       ),
                                    //       child: const Text('Dell'),
                                    //     ),
                                    //     ElevatedButton(
                                    //       onPressed: () {
                                    //         desktopComputerController.changecategoriesdata(3);/// Change to Design 3
                                    //       },
                                    //       style: ElevatedButton.styleFrom(
                                    //         primary:   desktopComputerController.selectedDesign.value == 3
                                    //             ? Colors.green // Change to green if selected
                                    //             : Colors.white, // Null to use default color
                                    //       ),
                                    //       child: const Text('Lenovo'),
                                    //     ),
                                    //   ],
                                    // ),),
                                    LaptopListViewProductComponent(),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    ElevatedButton(
                                      child: const Text('Show notifications'),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Design1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   LenovoLaptopProductComponent();
  }
}

class Design2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: const Center(
        child: Text(
          'Design 2',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class Design3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.green,
      child: const Center(
        child: Text(
          'Design 3',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
