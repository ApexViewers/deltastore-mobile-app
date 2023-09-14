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
import 'package:sizer/sizer.dart';

import '../../../constant/image_assets.dart';

class MyImageSlider extends StatefulWidget {
  const MyImageSlider({super.key});

  @override
  _MyImageSliderState createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    ImageAssests.bannerImage1.toString(),
    ImageAssests.bannerImage2.toString(),
    ImageAssests.bannerImage1.toString(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 9 / 17,
                height: 104.0,
                viewportFraction: 1.0,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: _imageUrls.map((url) {
                return Image.asset(
                  url,
                  // fit: BoxFit.fill,
                  width: double.infinity,
                  // height: 400,
                );
              }).toList(),
            ),
            Positioned(
              bottom: 2.h,
              left: 45.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
          ],
        )
      ],
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _imageUrls.length; i++) {
      indicators.add(
        Container(
          width: 8.0,
          height: 12.0,
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == i ? Colors.white : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}
