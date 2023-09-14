//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../constant/decorations.dart';
// import '../../../constant/paddings.dart';
// import '../../../constant/spacing.dart';
// import '../../../constant/styles/app_textstyles.dart';
// import '../../../constant/styles/colors.dart';
// import '../components/dell_laptop_component/laptop_grid_view_product_component.dart';
// import '../components/dell_laptop_component/laptop_listview_products_component.dart';
// import '../controller/dell_laptop_controller.dart';
// import '../controller/hplaptop_product_controller.dart';
//
// class DellLaptop extends StatefulWidget {
//   const DellLaptop({Key? key}) : super(key: key);
//
//   @override
//   State<DellLaptop> createState() => _DellLaptopState();
// }
//
// class _DellLaptopState extends State<DellLaptop> {
//   @override
//   Widget build(BuildContext context) {
//     var delllaptopProductsController = Get.put(DellLaptopController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dell Laptop",),
//         backgroundColor: appthem,
//       ),
//       body:  Column(
//         children: [
//           Padding(
//             padding: padA5,
//             child: Row(
//               children: [
//                 Text(
//                   " Dell",
//                   style: hMediumX,
//                 ),
//                 const Spacer(),
//                 Obx(() => delllaptopProductsController.isGridView.value
//                     ? Align(
//                   child: IconButton(
//                       onPressed: () {
//                         delllaptopProductsController.changListType();
//                       },
//                       icon: const Icon(Icons.list)),
//                 )
//                     : IconButton(
//                     onPressed: () {
//                       delllaptopProductsController.changListType();
//                     },
//                     icon: const Icon(Icons.dashboard))),
//               ],
//             ),
//           ),
//           vSpac12,
//           Obx(() => delllaptopProductsController.isGridView.value
//               ? Flexible(
//             child: Container(
//                 decoration: productBox,
//                 height: 1000,
//                 child: GridView.builder(
//                     padding: const EdgeInsets.only(
//                         left: 10, right: 10, bottom: 10),
//                     gridDelegate:
//                     const SliverGridDelegateWithMaxCrossAxisExtent(
//                         maxCrossAxisExtent: 200,
//                         childAspectRatio: 2 / 3,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10),
//                     itemCount: 10,
//                     itemBuilder: (BuildContext ctx, index) {
//                       return const DellLaptopGridProductComponent();
//                     })),
//           )
//               : SizedBox(
//             //decoration: productBox,
//             height: 500,
//             child: ListView.builder(
//                 itemCount: 10,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.only(
//                         left: index == 0 ? 10 : 12,
//                         right: index == 9 ? 10 : 0,
//                         top: 5,
//                         bottom: 5),
//                     child: const DellLaptopListViewProductComponent(),
//                   );
//                 }),
//           )),
//         ],
//       ),
//     );
//   }
// }
