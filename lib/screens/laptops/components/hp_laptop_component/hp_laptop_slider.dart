// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class MyImageSlider extends StatefulWidget {
//   const MyImageSlider({super.key});

//   @override
//   _MyImageSliderState createState() => _MyImageSliderState();
// }

// class _MyImageSliderState extends State<MyImageSlider> {
//   final List<String> _imageUrls = [
//     'https://ditllcae.com/wp-content/uploads/2023/01/Website-300x300.png',
//     'https://ditllcae.com/wp-content/uploads/2023/04/cover-3-1536x320.png',
//     'https://ditllcae.com/wp-content/uploads/2023/01/Website-300x300.png',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return CarouselSlider(
//       options: CarouselOptions(
//         autoPlay: true,
//         aspectRatio: 16 / 9,
//         enlargeCenterPage: true,
//       ),
//       items: _imageUrls.map((url) {
//         return Container(
//           width: width,
//           margin: const EdgeInsets.all(5.0),
//           child: ClipRRect(
//             borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//             child: Image.network(url, fit: BoxFit.cover),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/loading/ShimmerEffectloading.dart';
import '../../../../constant/paddings.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';
import '../../../../data/Controllers/product_by_id_controller/product_by_id_controller.dart';

class HpImageSlider extends StatefulWidget {
  const HpImageSlider({super.key});

  @override
  _HpImageSliderState createState() => _HpImageSliderState();
}

class _HpImageSliderState extends State<HpImageSlider> {
  int _currentIndex = 0;
  CarouselController carouselController = CarouselController();
  final List<String> _imageUrls = [
    'https://deltastore.ae/wp-content/uploads/2023/06/2-15.jpg',
    'https://deltastore.ae/wp-content/uploads/2023/06/Acer-Chromebook-CB3-431-1536x1536.jpg',
    'https://deltastore.ae/wp-content/uploads/2023/06/3-12.jpg',
    'https://deltastore.ae/wp-content/uploads/2023/06/1-17.jpg'
  ];
  var ProductidController = Get.put((ProductIdController()));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 9 / 14,
            height: 50.h,
            viewportFraction: 1.0,
            autoPlay: false,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items:ProductidController.productBYid.images ?.map((url) {
            return Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding:
                                padA6.add(const EdgeInsets.only(right: 20, top: 10)),
                            child: InkWell(
                              onTap:(){

                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: cGrey,
                                      borderRadius: BorderRadius.circular(30)),
                                  width: 9.w,
                                  height: 5.h,
                                  child: const Icon(
                                    Icons.favorite_border,
                                    size: 16,
                                    color: colorWhite,
                                  )),
                            ),
                          ),
                          Padding(
                            padding:
                                padA6.add(const EdgeInsets.only(right: 20, top: 10)),
                            child: InkWell(
                              onTap: () async {
                                dynamic name = "name";
                                final result = name.replaceAll(
                                    RegExp('[^A-Za-z0-9]'), '-');
                                name.trim();

                                final url = ProductidController.productBYid.permalink.toString();

                                await Share.share(url);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: cGrey,
                                      borderRadius: BorderRadius.circular(30)),
                                  width: 9.w,
                                  height: 5.h,
                                  child: const Icon(
                                    Icons.share_outlined,
                                    size: 16,
                                    color: colorWhite,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 29.h,
                    width: 65.w,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(
                        url.src.toString(),
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          EasyLoading.dismiss();
                          if (loadingProgress == null) {



                            return child;
                          }

                          else{
                            return const ShimmerEffectLoading();
                          }
                        },
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return Center(
                            child:Text("loading image error",style: hsmall.copyWith(color: cRed),),  // Show error icon if image fails to load
                          );
                        },
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicator(),
        ),
      ],
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _imageUrls.length; i++) {
      indicators.add(
        Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == i ? appthem : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}
