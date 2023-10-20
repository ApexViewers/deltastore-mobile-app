// import 'package:delta_app/constant/paddings.dart';
// import 'package:delta_app/constant/styles/app_textstyles.dart';
// import 'package:delta_app/constant/styles/colors.dart';
// import 'package:delta_app/screens/account/view/Registration.dart';
// import 'package:delta_app/screens/account/view/login.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
//
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
//
// import '../view/home.dart';
//
// class home extends StatefulWidget {
//   const home({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<home> createState() => _homeState();
// }
//
// class _homeState extends State<home> {
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//
//   // String selectedValue = '';
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final pages = [
//       HomeScreen(),
//       LoginScreen(),
//       RegistrationScreen(),
//       HomeScreen(),
//     ];
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: 8.h,
//         decoration: BoxDecoration(
//             // border: Border.all(color: Colors.black.withOpacity(0.3)),
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(15), topRight: Radius.circular(15))),
//         child: GNav(
//             tabBackgroundColor: cGrey,
//             curve: Curves.easeOutExpo,
//             haptic: true,
//             backgroundColor: colorWhite,
//             color: cGrey,
//             onTabChange: (index) {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//             hoverColor: cGrey,
//             activeColor: Colors.black,
//             tabs:  [
//               GButton(
//                 icon: Icons.home,
//                 textStyle: TextStyle(fontSize: 12),
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 leading: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.home),
//                     SizedBox(height: 4),
//                     Text('Home',style:hMedium.copyWith(fontSize: 12,color: cBlack)),
//                   ],
//                 ),
//               ),
//               GButton(
//                 iconColor: Colors.grey,
//                 iconActiveColor: appthem,
//                 icon: Icons.home,
//                 textStyle: TextStyle(fontSize: 12),
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 leading: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.message),
//                     SizedBox(height: 4),
//                     Text('message',style:hMedium.copyWith(fontSize: 12,color: cBlack),),
//                   ],
//                 ),
//               ),
//               GButton(
//                 icon: Icons.add_shopping_cart,
//                 textStyle: TextStyle(fontSize: 12),
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 leading: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.shopping_cart),
//                     SizedBox(height: 4),
//                     Text('Cart',style:hMedium.copyWith(fontSize: 12,color: cBlack) ,),
//                   ],
//                 ),
//               ),
//               GButton(
//                 icon: Icons.home,
//                 textStyle: TextStyle(fontSize: 12),
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 leading: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.person),
//                     SizedBox(height: 4),
//                     Text('Account',style:hMedium.copyWith(fontSize: 12,color: cBlack)),
//                   ],
//                 ),
//               ),
//
//               // GButton(
//               //   icon: LineIcons.user,
//               //   text: 'Order',
//               // ),
//             ]),
//       ),
//       body: pages[selectedIndex],
//       key: scaffoldKey,
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/screens/laptops/components/empty_cart_container.dart';
import 'package:test_app/screens/laptops/views/hp/add_to_cart.dart';

import '../../../constant/styles/colors.dart';
import '../../../routes/app_routes.dart';
import '../../Wishlist/view/wishlist.dart';
import '../../account/view/login.dart';
import '../../allorder/view/allorder.dart';
import '../../categories/view/categories.dart';

import '../../setting/Screen/view.dart';
import '../view/home.dart';

class Bar extends StatefulWidget {
  int? initialIndex;

  Bar({
    Key? key,this.initialIndex
  }) : super(key: key, );

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  var  currentIndex=0.obs;
  @override
  void initState() {
    getStringValuesSF();
    if (widget.initialIndex != null) {
      currentIndex.value = widget.initialIndex!;
    }
    // TODO: implement initState
    super.initState();
  }

  String? loginID;

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    loginID = prefs.getString('username');
  }



  @override
  Widget build(BuildContext context) {
    //print(loginID.toString() + "login id show");
    return WillPopScope(
      onWillPop: () async => false,
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          activeColor: appthem,
          inactiveColor: cDarkGray,
          backgroundColor: colorWhite,

          //  backgroundColor: Color(0xff2086AE),
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.home,
                  color: cDarkGray,
                ),
                activeIcon: const Icon(
                  Icons.home,
                  color: appthem,
                ),
                label: 'Home',
                tooltip: 'tool tip'),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.menu,
                  color: cDarkGray,
                ),
                activeIcon: const Icon(
                  Icons.menu,
                  color: appthem,
                ),
                label: 'categories'),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.favorite_border,
                  color: cDarkGray,
                ),
                activeIcon: const Icon(
                  Icons.favorite,
                  color: appthem,
                ),
                label: 'WishList'),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: cDarkGray,
                ),
                activeIcon: const Icon(
                  Icons.shopping_cart,
                  color: appthem,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.person_outline,
                  color: cDarkGray,
                ),
                activeIcon: const Icon(
                  Icons.person,
                  color: appthem,
                ),
                label: 'Account'),
          ],
          currentIndex: currentIndex.value, // This is where we use the currentIndex property
          onTap: (index) {
            setState(() {
              currentIndex.value = index; // Update currentIndex when a new tab is tapped
            });
          },
        ),


        tabBuilder: (context, select) {
          Widget page;
          switch (select) {
            case 0:
              page = const HomeScreen();
              break;
            case 1:
              page = const AllCategories();
              break;
            case 2:
              page = const Wishlist();
              break;
            case 3:
              page = AllOrder();
              break;
            case 4:
              page = loginID == null ? LoginScreen() : const SettingScreen();
              break;
            default:
              page = Container();
          }
          return CupertinoTabView(
            onGenerateRoute: AppRoutes.generateRoute,
            builder: (context) => Material(child: page),
          );
        },
      ),
    );
  }
}
