import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constant/paddings.dart';
import '../constant/styles/app_textstyles.dart';
import '../screens/about/view/about_screen.dart';
import '../screens/contact/contect_us.dart';
import '../screens/customer_service/customer_service.dart';
import '../screens/laptops/views/laptop_products.dart';
import '../screens/visit_our_store/visit_our_store.dart';
import '../screens/warranty/warranty.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://ditllcae.com/wp-content/uploads/2022/12/Ditlogo.png",
                  height: 50,
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'All',
              style: hMediumX.copyWith(fontSize: 14),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          const Padding(
            padding: padA1,
            child: Divider(),
          ),
          ExpansionTile(title: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Text("Laptop", style: hMediumX.copyWith(fontSize: 14),),
          ), children: [
            Padding(
              padding:padA5 ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {
                        Get.to(()=>const LaptopProducts());
                      }, child: Text("Laptop"
                          ,style: hsmall,)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, hplaptopscreen);
                      }, child: Text("HP",style: hsmall,)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, delllaptopscreen);
                      }, child: Text("Dell",style: hsmall)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, laptopproductsscreen);
                      }, child: Text("Lenovo",style: hsmall,)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, laptopproductsscreen);
                      }, child: Text("Toshiba",style: hsmall,)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, laptopproductsscreen);
                      }, child: Text("Apple",style: hsmall,)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, laptopproductsscreen);
                      }, child: Text("2 in 1",style: hsmall,)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, laptopproductsscreen);
                      }, child: Text("Tables",style: hsmall,)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, laptopproductsscreen);
                      }, child: Text("Chrome book",style: hsmall,)),

                    ],
                  )
                ],
              ),
            )

          ]),

          const Padding(
            padding: padA1,
            child: Divider(),
          ),
          ExpansionTile(title: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Text("Desktop Computers", style: hMediumX.copyWith(fontSize: 14),),
          ), children: [
            Padding(
              padding:padA5 ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, desktopcomputerhome);
                      }, child: Text("Desktop Computers",style: hsmall,)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, desktopcomputerhome);
                      }, child: Text("HP",style: hsmall,)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, desktopcomputerhome);
                      }, child: Text("Dell",style: hsmall)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, desktopcomputerhome);
                      }, child: Text("Lenovo",style: hsmall,)),


                    ],
                  )
                ],
              ),
            )

          ]),

          const Padding(
            padding: padA1,
            child: Divider(),
          ),
          ExpansionTile(title: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Text("Desktop Moniters", style: hMediumX.copyWith(fontSize: 14),),
          ), children: [
            Padding(
              padding:padA5 ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, desktopmoniterhome);
                      }, child: Text("Desktop Moniters",style: hsmall,)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, desktopmoniterhome);
                      }, child: Text("HP",style: hsmall,)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, desktopmoniterhome);
                      }, child: Text("Dell",style: hsmall)),
                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, desktopmoniterhome);
                      }, child: Text("Lenovo",style: hsmall,)),

                      TextButton(onPressed: () {
                        // Navigator.pushNamed(context, desktopmoniterhome);
                      }, child: Text("Apple",style: hsmall,)),


                    ],
                  )
                ],
              ),
            )

          ]),

          const Padding(
            padding: padA1,
            child: Divider(),
          ),
          ExpansionTile(title: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Text("Customer Service", style: hMediumX.copyWith(fontSize: 14),),
          ), children: [
            Padding(
              padding:padA5 ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {

                        Get.to(()=>const CustomerService());

                      }, child: Text("Customer Service",style: hsmall,)),
                      TextButton(onPressed: () {
                        Get.to(()=>const Warranty());
                      }, child: Text("Warranty",style: hsmall,)),
                      TextButton(onPressed: () {
                        Get.to(()=>const VisitOurStore());

                      }, child: Text("Visit Our Store",style: hsmall)),




                    ],
                  )
                ],
              ),
            )

          ]),
          // ListTile(
          //   title: Text(
          //     'Customer Service',
          //     style: hMediumX.copyWith(fontSize: 14),
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, customerservicescreen);
          //   },
          // ),
          // const Padding(
          //   padding: padA1,
          //   child: Divider(),
          // ),
          // ListTile(
          //   title: Text(
          //     'Warranty',
          //     style: hMediumX.copyWith(fontSize: 14),
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, warrantyscreen); // Close the drawer
          //   },
          // ),
          // const Padding(
          //   padding: padA1,
          //   child: Divider(),
          // ),
          // ListTile(
          //   title: Text(
          //     'Visit Our Store',
          //     style: hMediumX.copyWith(fontSize: 14),
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, visitourstorescreen);
          //     // Close the drawer
          //   },
          // ),
          const Padding(
            padding: padA1,
            child: Divider(),
          ),
          ListTile(
            title: Text(
              'About',
              style: hMediumX.copyWith(fontSize: 14),
            ),
            onTap: () {
              Get.to(()=>const AboutScreen());


              log("about screen rout");
            },
          ),
          const Padding(
            padding: padA1,
            child: Divider(),
          ),
          ListTile(
            title: Text(
              'Contact',
              style: hMediumX.copyWith(fontSize: 14),
            ),
            onTap: () {
              Get.to(()=>const ContactUs());
              // Close the drawer
            },
          ),
          const Padding(
            padding: padA1,
            child: Divider(),
          ),

           ExpansionTile(title: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Text("Sales & promotions", style: hMediumX.copyWith(fontSize: 14),),
            ), children: [
              Padding(
                padding:padA5 ,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(onPressed: () {
                          // Navigator.pushNamed(context, salesproductscreen);
                        }, child: Text("40% sales",style: hsmall,)),
                        TextButton(onPressed: () {
                          // Navigator.pushNamed(context, salesproductscreen);
                        }, child: Text("Monthly Deals",style: hsmall)),
                        TextButton(onPressed: () {
                          // Navigator.pushNamed(context, salesproductscreen);
                        }, child: Text("Weekend Deals",style: hsmall,))
                      ],
                    )
                  ],
                ),
              )

            ]),


          const Padding(
            padding: padA1,
            child: Divider(),
          ),
          ListTile(
            title: Text(
              'Pantum Printers',
              style: hMediumX.copyWith(fontSize: 14),
            ),
            onTap: () {
              // Navigator.pushNamed(context, pantumprintersscreen);
              // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
