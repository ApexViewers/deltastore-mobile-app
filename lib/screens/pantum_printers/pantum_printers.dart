
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/screens/pantum_printers/pantum_image_slider.dart';
import 'package:test_app/screens/pantum_printers/printer_details.dart';

import '../../constant/paddings.dart';
import '../../constant/styles/app_textstyles.dart';
import '../../constant/styles/colors.dart';
import '../../reuseable_widgets/rounded_button.dart';
import '../home/components/my_image_slider.dart';

class PantumPrinters extends StatefulWidget {
  const PantumPrinters({Key? key}) : super(key: key);

  @override
  State<PantumPrinters> createState() => _PantumPrintersState();
}

class _PantumPrintersState extends State<PantumPrinters> {
  final List<Map<String, dynamic>> dataList = [
    {
      'image':
          'https://deltastore.ae/wp-content/uploads/2023/06/M6550NW-Main-Images-1-300x300.jpg',
      'text': 'Black Print Copy & Scanner',
    },
    {
      'image':
          'https://deltastore.ae/wp-content/uploads/2023/06/M7100DW-Main-Images-1-300x300.jpg',
      'text': 'Color Print Copy & Scan',
    },
    {
      'image':
          'https://deltastore.ae/wp-content/uploads/2023/06/P2500W-Main-Images-1-300x300.jpg',
      'text': 'Black Laser jet',
    },
    {
      'image':
          'https://deltastore.ae/wp-content/uploads/2023/06/pc252_toner_941d-300x300.jpg',
      'text': 'TONNER AND CARTRIGES',
    },
  ];
  final List<Map<String, dynamic>> printerList = [
    {
      'image':
          'https://deltastore.ae/wp-content/uploads/2023/06/M6550NW-Main-Images-1-300x300.jpg',
      'text': 'CP1100DW Color Single Function',
      'price': 'AED 320',
    },
    {
      'image':
          'https://deltastore.ae/wp-content/uploads/2023/06/M7100DW-Main-Images-1-300x300.jpg',
      'text': 'CM1100ADW Color Multi Function Printer',
      'price': 'AED 250',
    },
    {
      'image':
          'https://deltastore.ae/wp-content/uploads/2023/06/P2500W-Main-Images-1-300x300.jpg',
      'text': 'CM1100ADW Color Multi Function Printer',
      'price': 'AED 300',
    },
    {
      'image':
          'https://deltastore.ae/wp-content/uploads/2023/06/pc252_toner_941d-300x300.jpg',
      'text': 'CP1100DW Color Single Function',
      'price': 'AED 320',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantum Printers"),
        backgroundColor: appthem,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padA5,
          child: Column(
            children: [
              PantumImageSlider(),
              Text(
                "Pantum Printers",
                style: hMedium,
              ),
              Text(
                "Choose the best Category  of your choice",
                style: hsmall.copyWith(
                    color: Colors.green, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 24.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Container(
                              height: 12.h, // Set the desired height
                              width: 35.w,
                              child: Image.network(dataList[index]["image"]),
                            ),
                            Padding(
                              padding: padA5,
                              child: Text(
                                dataList[index]['text'],
                                style: hsmall.copyWith(fontSize: 9),
                              ),
                            ),
                            RoundedButton(
                              size: 12,
                              width: 29.w,
                              onTap: () {},
                              textButton: "Show Now",
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              InkWell(

                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: cGrey.withOpacity(0.3), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset: Offset(0, 3), // Offset in x and y direction
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Printer",
                            style: hMedium.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                      Container(
                        height: 27.h,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: printerList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  Get.to(()=>PrinterDetails(
                                    price:printerList[index]['price'] ,
                                    image:dataList[index]["image"].toString() ,
                                    nameFunctionality:printerList[index]['text'].toString() ,
                                  ));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      child: Padding(
                                        padding: padA5,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("printer", style: hsmall),
                                                Text(
                                                  printerList[index]['text'],
                                                  style:
                                                      hsmall.copyWith(fontSize: 11),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 12.h,
                                              // Set the desired height
                                              width: 35.w,
                                              child:dataList[index]["image"]=="null"?CircularProgressIndicator(): Image.network(
                                                  dataList[index]["image"]),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  printerList[index]['price'],
                                                  style: hMedium.copyWith(
                                                      fontSize: 12, color: Colors.black),
                                                ),
                                                SizedBox(width: 16.w,),
                                                Container(
                                                  height: 5.h,
                                                  width: 12.w,
                                                  decoration: BoxDecoration(
                                                    color: cGrey,

                                                    borderRadius: BorderRadius.circular(40)
                                                  ),
                                                  child: Center(child: Icon(

                                                      Icons.shopping_cart,color:colorWhite ,)),
                                                )
                                              ],
                                            ),
                                            RatingBar.builder(
                                              itemSize: 16,
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 3,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 2.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                size: 8,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      RoundedButton(
                        size: 15,
                        width: 33.w,
                        onTap: () {},
                        textButton: "view All",
                      ),
                    ],
                  ),
                ),

              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: cGrey.withOpacity(0.3), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Offset in x and y direction
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Drum",
                          style: hMedium.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      height: 27.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: printerList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  child: Padding(
                                    padding: padA5,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Drum", style: hsmall),
                                            Text(
                                              printerList[index]['text'],
                                              style:
                                              hsmall.copyWith(fontSize: 11),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 12.h,
                                          // Set the desired height
                                          width: 35.w,
                                          child: Image.network(
                                              dataList[index]["image"]),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              printerList[index]['price'],
                                              style: hMedium.copyWith(
                                                  fontSize: 12, color: Colors.black),
                                            ),
                                            SizedBox(width: 16.w,),
                                            Container(
                                              height: 5.h,
                                              width: 12.w,
                                              decoration: BoxDecoration(
                                                  color: cGrey,

                                                  borderRadius: BorderRadius.circular(40)
                                              ),
                                              child: Center(child: Icon(

                                                Icons.shopping_cart,color:colorWhite ,)),
                                            )
                                          ],
                                        ),
                                        RatingBar.builder(
                                          itemSize: 16,
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 3,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            size: 8,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    RoundedButton(
                      size: 15,
                      width: 33.w,
                      onTap: () {},
                      textButton: "view All",
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: cGrey.withOpacity(0.3), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Offset in x and y direction
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Toner Cartridge",
                          style: hMedium.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      height: 27.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: printerList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  child: Padding(
                                    padding: padA5,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Toner Cartridge", style: hsmall),
                                            Text(
                                              printerList[index]['text'],
                                              style:
                                              hsmall.copyWith(fontSize: 11),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 12.h,
                                          // Set the desired height
                                          width: 35.w,
                                          child: Image.network(
                                              dataList[index]["image"]),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              printerList[index]['price'],
                                              style: hMedium.copyWith(
                                                  fontSize: 12, color: Colors.black),
                                            ),
                                            SizedBox(width: 16.w,),
                                            Container(
                                              height: 5.h,
                                              width: 12.w,
                                              decoration: BoxDecoration(
                                                  color: cGrey,

                                                  borderRadius: BorderRadius.circular(40)
                                              ),
                                              child: Center(child: Icon(

                                                Icons.shopping_cart,color:colorWhite ,)),
                                            )
                                          ],
                                        ),
                                        RatingBar.builder(
                                          itemSize: 16,
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 3,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            size: 8,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    RoundedButton(
                      size: 15,
                      width: 33.w,
                      onTap: () {},
                      textButton: "view All",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
