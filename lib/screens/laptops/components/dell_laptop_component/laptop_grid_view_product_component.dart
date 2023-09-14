// import 'package:delta_app/constant/decorations.dart';
// import 'package:delta_app/constant/paddings.dart';
// import 'package:delta_app/constant/spacing.dart';
// import 'package:delta_app/constant/styles/app_textstyles.dart';
// import 'package:delta_app/constant/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:sizer/sizer.dart';
//
// class DellLaptopGridProductComponent extends StatelessWidget {
//   const DellLaptopGridProductComponent({super.key});
// //change........
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: productBox,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: padA1,
//             child: Row(
//               children: [
//                 Text(
//                   "Chrome Book",
//                   style: hsmall.copyWith(fontSize: 11),
//                 ),
//                 SizedBox(
//                   width: 1.w,
//                 ),
//                 Text(
//                   "HP",
//                   style: hsmall.copyWith(fontSize: 11),
//                 ),
//                 SizedBox(
//                   width: 1.w,
//                 ),
//                 Text(
//                   "Laptops",
//                   style: hsmall.copyWith(fontSize: 11),
//                   overflow: TextOverflow.ellipsis,
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: padA1,
//             child: Text("Dell Latitude 340 |\n Intel Core I5 8th Generation ",
//                 style: hxMedium.copyWith(fontSize: 10)),
//           ),
//           vSpac10,
//           Center(
//             child: Image.network(
//               "https://ditllcae.com/wp-content/uploads/2023/03/Dell-Latitude-E6440-300x300.png",
//               height: 100,
//             ),
//           ),
//           Row(
//             children: [
//               hSpac14,
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("AED 700 ", style: hMedium.copyWith(fontSize: 12)),
//                   Text(
//                     "AED 1000 ",
//                     style: hsmall.copyWith(fontSize: 9),
//                   ),
//                 ],
//               ),
//               hSpac30,
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.shopping_basket,
//                     color: cBlack,
//                   ))
//             ],
//           ),
//           Padding(
//             padding: padA1,
//             child: RatingBar.builder(
//               initialRating: 3,
//               minRating: 1,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemSize: 20,
//               itemBuilder: (context, _) => const Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rating) {
//                 print(rating);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
