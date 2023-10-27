import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/routes/app_routes.dart';

import 'bindings/initializing_dependenciese.dart';
import 'constant/routs_strings/routs_strings.dart';
import 'constant/styles/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // NotificationService().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      //BaseClientClass.isInternetConnected();
      return GetMaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: 'Delta Store',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: colorWhite,
                statusBarIconBrightness: Brightness.dark),
          ),
          primarySwatch: Colors.blue,
        ),
        initialBinding: InitializingDependencise(),
        initialRoute: splashscreen,
        onGenerateRoute: AppRoutes.generateRoute,
      );
    });
  }
}
