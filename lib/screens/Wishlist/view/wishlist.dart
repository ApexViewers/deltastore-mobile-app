import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../reuseable_widgets/appbar_widget.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> wishlistmodel = [
      {
        'image':
            'https://images.priceoye.pk/infinix-note-12-pakistan-priceoye-goykl-270x270.webp',
        'name':
            'Apple Watch Series 6 (44mm, GPS) Space Grey Aluminum Case with Black Sport Band',
        'condition': 'Pre-Loved | Good',
        'price': '699.00',
        'cutprice': '899.00',
      },
      {
        'image':
            'https://images.priceoye.pk/infinix-note-12-pakistan-priceoye-goykl-270x270.webp',
        'name':
            'Apple Watch Series 6 (44mm, GPS) Space Grey Aluminum Case with Black Sport Band',
        'condition': 'Pre-Loved | Good',
        'price': '699.00',
        'cutprice': '899.00',
      },
      {
        'image':
            'https://images.priceoye.pk/infinix-note-12-pakistan-priceoye-goykl-270x270.webp',
        'name':
            'Apple Watch Series 6 (44mm, GPS) Space Grey Aluminum Case with Black Sport Band',
        'condition': 'Pre-Loved | Good',
        'price': '699.00',
        'cutprice': '899.00',
      },
      {
        'image':
            'https://images.priceoye.pk/infinix-note-12-pakistan-priceoye-goykl-270x270.webp',
        'name':
            'Apple Watch Series 6 (44mm, GPS) Space Grey Aluminum Case with Black Sport Band',
        'condition': 'Pre-Loved | Good',
        'price': '699.00',
        'cutprice': '899.00',
      },
      {
        'image':
            'https://images.priceoye.pk/infinix-note-12-pakistan-priceoye-goykl-270x270.webp',
        'name':
            'Apple Watch Series 6 (44mm, GPS) Space Grey Aluminum Case with Black Sport Band',
        'condition': 'Pre-Loved | Good',
        'price': '699.00',
        'cutprice': '899.00',
      },
    ];

    return Scaffold(
        backgroundColor: cGrey.withOpacity(0.1),
        appBar: AppBar(
          elevation: 0,
          title: const Appbar(),
          backgroundColor: colorWhite,
        ),
        body: Container(
          margin: EdgeInsets.all(10.sp),
          child: ListView.separated(
              itemCount: wishlistmodel.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                    height: 2.h,
                  ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorWhite),
                  width: double.infinity,
                  height: 13.h,
                  child: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          wishlistmodel[index]["image"],
                          height: 8.h,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wishlistmodel[index]['name'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: hsmall.copyWith(fontSize: 12),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                                child: Text(
                                  'Condition: ${wishlistmodel[index]['condition']}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'AED ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${wishlistmodel[index]['price']} ',
                                      style: hsmall.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                        text: wishlistmodel[index]['cutprice'],
                                        style: hsmall.copyWith(
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        PopupMenuButton<String>(
                          padding: const EdgeInsets.only(bottom: 26, left: 26),
                          iconSize: 20,
                          itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem<String>(
                                value: 'cart',
                                child: Text('Add to Cart'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ];
                          },
                          onSelected: (String value) {
                            // Handle menu item selection
                            print('Selected: $value');
                          },
                        )
                      ],
                    ),
                  ),
                );
              }),
        )

        //------if wishlist is empty
        // Container(
        //   width: double.infinity,
        //   margin: EdgeInsets.all(25.sp),
        //   decoration: BoxDecoration(
        //       color: colorWhite, borderRadius: BorderRadius.circular(10)),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         'Your Wishlist is empty!',
        //         style: hMediumX.copyWith(fontSize: 17),
        //       ),
        //       SizedBox(
        //         height: 2.h,
        //       ),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 7.w),
        //         child: Text(
        //           'Dont worry, you can easily fix that by browsing through our top categories or go find the products you like.',
        //           textAlign: TextAlign.center,
        //           style: hsmall,
        //         ),
        //       ),
        //       Container(
        //         margin: EdgeInsets.symmetric(vertical: 3.5.h),
        //         decoration: BoxDecoration(shape: BoxShape.circle, color: cGrey.withOpacity(0.1)),
        //         child: Padding(
        //           padding: EdgeInsets.all(15.0.sp),
        //           child: Icon(
        //             Icons.add_shopping_cart_sharp,
        //             size: 45.sp,
        //             color: cDarkGray,
        //           ),
        //         ),
        //       ),
        // RoundedButton(
        //   width: 70.w,
        //   textButton: 'Start Shopping',
        //   textColor: cBlack,
        //   borderColor: cBlack,
        //   onTap: () {
        //     print('tap');
        //     const Bar();
        //   },
        //   backGroundColor: colorWhite,
        // )
        //     ],
        //   ),
        // ),
        );
  }
}
