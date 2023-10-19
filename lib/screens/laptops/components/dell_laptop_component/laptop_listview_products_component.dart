// import 'package:delta_app/constant/decorations.dart';
// import 'package:delta_app/constant/paddings.dart';
// import 'package:delta_app/constant/spacing.dart';
// import 'package:delta_app/constant/styles/app_textstyles.dart';
// import 'package:delta_app/constant/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// class DellLaptopListViewProductComponent extends StatelessWidget {
//   const DellLaptopListViewProductComponent({super.key});
//
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
//                   "Dell",
//                   style: hsmall,
//                 ),
//                 hSpac10,
//                 Text(
//                   "Laptop",
//                   style: hsmall,
//                 ),
//                 hSpac10,
//                 Text(
//                   "Latitude",
//                   style: hsmall,
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: padA1,
//             child: Text("Dell Latitude 340 |\n Intel Core I5 8th Generation ",
//                 style: hxMedium),
//           ),
//           vSpac10,
//           Image.network(
//               "https://ditllcae.com/wp-content/uploads/2023/01/Dell-Latitude-5290-300x300.png"),
//           Row(
//             children: [
//               hSpac14,
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("AED 700 ", style: hMedium),
//                   Text(
//                     "AED 1000 ",
//                     style: hsmall,
//                   ),
//                 ],
//               ),
//               hSpac60,
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.shopping_basket,
//                     color: cBlack,
//                   ))
//             ],
//           ),
//           vSpac10,
//           Padding(
//             padding: padA1,
//             child: RatingBar.builder(
//               initialRating: 3,
//               minRating: 1,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemSize: 30,
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
