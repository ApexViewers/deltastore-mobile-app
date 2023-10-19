import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class GooglemapController extends GetxController {
  RxBool loadingmap = false.obs;
  opengooglemap(Lat, Lng) async {
    loadingmap.value = true;
    final url = 'https://www.google.com/maps/search/?api=1&query=$Lat,$Lng';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
    loadingmap.value = false;
  }
}
