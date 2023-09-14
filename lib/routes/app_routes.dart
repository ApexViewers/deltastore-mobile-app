
import 'package:flutter/material.dart';

import '../constant/routs_strings/routs_strings.dart';
import '../screens/about/view/about_screen.dart';
import '../screens/account/view/Registration.dart';
import '../screens/account/view/login.dart';
import '../screens/address/view/address_screen.dart';
import '../screens/contact/contect_us.dart';
import '../screens/customer_service/customer_service.dart';
import '../screens/desktop_computer/view/desktop_computer_home.dart';
import '../screens/desktop_moniter/view/desktop_moniter_home.dart';
import '../screens/home/components/nav_bar_component.dart';
import '../screens/laptops/views/dell_laptop.dart';
import '../screens/laptops/views/hp/hp_details.dart';
import '../screens/laptops/views/hp/hp_laptop.dart';
import '../screens/laptops/views/laptop_products.dart';
import '../screens/pantum_printers/pantum_printers.dart';
import '../screens/sales_promotions/sales_product.dart';
import '../screens/setting/Screen/view.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/visit_our_store/google_map.dart';
import '../screens/visit_our_store/visit_our_store.dart';
import '../screens/warranty/warranty.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case homescreen:
        return MaterialPageRoute(builder: (context) =>  Bar());
      case splashscreen:
        return MaterialPageRoute(builder: (context) =>  DualRotationAnimationPage());

      case laptopproductsscreen:
        return MaterialPageRoute(builder: (context) => const LaptopProducts());
       Map<String,dynamic> arguments=setting.arguments as Map<String,dynamic>;
      case customerservicescreen:

        return MaterialPageRoute(builder: (context) => const CustomerService());

      case desktopcomputerhome:
        return MaterialPageRoute(
            builder: (context) => const DesktopComputerHome());

      case desktopmoniterhome:
        return MaterialPageRoute(
            builder: (context) => const DesktopMoniterHome());

      case aboutscreen:
        return MaterialPageRoute(builder: (context) => const AboutScreen());
      case warrantyscreen:
        return MaterialPageRoute(builder: (context) => const Warranty());
      case contactscreen:
        return MaterialPageRoute(builder: (context) => const ContactUs());
      case visitourstorescreen:
        return MaterialPageRoute(builder: (context) => const VisitOurStore());
      case googlemapscreen:
        return MaterialPageRoute(builder: (context) =>  GoogleMapScreen());
      case pantumprintersscreen:
        return MaterialPageRoute(builder: (context) =>  PantumPrinters());
      case salesproductscreen:
        return MaterialPageRoute(builder: (context) =>  SalesProduct());
      case hplaptopscreen:
        return MaterialPageRoute(builder: (context) =>  HpLaptops());
      // case delllaptopscreen:
      //   return MaterialPageRoute(builder: (context) =>  DellLaptop());
      case Hplaptopdetailscreen:
        return MaterialPageRoute(builder: (context) =>  HpLaptopDetailsScreen());
      case loginscreen:
        return MaterialPageRoute(builder: (context) =>  LoginScreen());
      case registrationScreen:
        return MaterialPageRoute(builder: (context) =>  RegistrationScreen());
      case addressScreen:
        return MaterialPageRoute(builder: (context) =>  AddressScreen());
      case customerservicescreen:

        return MaterialPageRoute(builder: (context) => const SettingScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Bar());
    }
  }
}
