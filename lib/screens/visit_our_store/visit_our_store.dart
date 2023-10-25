import 'package:chewie/chewie.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../../constant/image_assets.dart';
import '../../constant/paddings.dart';
import '../../constant/styles/colors.dart';
import '../../reuseable_widgets/bold_text_widget.dart';
import '../../reuseable_widgets/normal_text.dart';
import '../../reuseable_widgets/rounded_button.dart';
import 'google_map.dart';

class VisitOurStore extends StatefulWidget {
  const VisitOurStore({Key? key}) : super(key: key);

  @override
  State<VisitOurStore> createState() => _VisitOurStoreState();
}

class _VisitOurStoreState extends State<VisitOurStore> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializeVideoPlayer() async {
    videoPlayerController = VideoPlayerController.network(
        "https://deltastore.ae/wp-content/uploads/2023/01/Store-Video.mp4");
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: cBlack,
            )),
        elevation: 0,
        backgroundColor: colorWhite,
        title: SizedBox(
          width: 60.w,
          child: Image.asset(
            ImageAssests.logoImge.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padA5,
          child: Column(
            children: [
              Center(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                        // color: Colors.amber,
                        height: 210,
                        child: chewieController != null &&
                                chewieController!
                                    .videoPlayerController.value.isInitialized
                            ? Chewie(
                                controller: chewieController!,
                              )
                            : Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: s.width,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 20),
                                    Text('Loading...'),
                                  ],
                                ),
                              ))),
              ),
              Card(
                child: Padding(
                  padding: padA5,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 35,
                      ),
                      BoldText(
                          textBold:
                              "Delta International Mobile Phone & Electric Devices Trd LLC - Branch 1​"),
                      NormalText(
                          normalText:
                              "Sharjah Indus Area -2, Shed No 2, Malik Javaid Hassan Omar Bajaba"),
                      RoundedButton(
                          backGroundColor: appthem,
                          borderRadius: 4,
                          textButton: ("Show on Map"),
                          onTap: () {
                            Get.to(() => GoogleMapScreen(
                                  Lat: 25.32320461437014,
                                  Lng: 55.418829140215955,
                                  title:
                                      "Delta International Mobile Phone & Electric Devices Trd LLC - Branch 1​",
                                ));
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
                child: Card(
                  child: Padding(
                    padding: padA5,
                    child: Column(
                      children: [
                        const Icon(Icons.email),
                        BoldText(textBold: "EMAIL"),
                        NormalText(normalText: "Email : Info@ditllcae.com"),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: padA5,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 35,
                      ),
                      BoldText(
                          textBold:
                              "Delta International Mobile Phone & Electric Devices Trd LLC"),
                      NormalText(
                          normalText:
                              "Showroom No.1, Al Nabooda, Bldg, 2nd industrial.St # 2, Ind. Area 6-Sharjah"),
                      RoundedButton(
                          borderRadius: 4,
                          backGroundColor: appthem,
                          textButton: ("Show on Map"),
                          onTap: () {
                            Get.to(() => GoogleMapScreen(
                                  title:
                                      "Delta International Mobile Phone & Elect. Devices TR LLC",
                                  Lat: 25.323078819301507,
                                  Lng: 55.41712345024681,
                                ));
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
                child: Card(
                  child: Padding(
                    padding: padA5,
                    child: Column(
                      children: [
                        const Icon(Icons.email),
                        BoldText(textBold: "EMAIL"),
                        NormalText(normalText: "Email : Info@ditllcae.com"),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: padA5,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 35,
                      ),
                      BoldText(
                          textBold:
                              "Delta International Mobile Phone & Electric Devices Trd LLC - Branch 2"),
                      NormalText(
                          normalText:
                              "Showroom No.3, Al Nabooda, Bldg, 2nd industrial.St # 2, Ind. Area 6-Sharjah"),
                      RoundedButton(
                          backGroundColor: appthem,
                          borderRadius: 4,
                          textButton: ("Show on Map"),
                          onTap: () {
                            Get.to(() => GoogleMapScreen(
                                  title: "DELTA INTERNATIONAL SHARJAH",
                                  Lat: 25.322771640693855,
                                  Lng: 55.41633289814799,
                                ));
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
                child: Card(
                  child: Padding(
                    padding: padA5,
                    child: Column(
                      children: [
                        const Icon(Icons.email),
                        BoldText(textBold: "EMAIL"),
                        NormalText(normalText: "Email : Info@ditllcae.com"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
