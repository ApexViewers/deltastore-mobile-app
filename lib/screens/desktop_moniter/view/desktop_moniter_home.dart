
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/styles/app_textstyles.dart';
import '../../../constant/decorations.dart';
import '../../../constant/paddings.dart';
import '../../../constant/spacing.dart';
import '../../../constant/styles/colors.dart';
import '../components/desktop_moniter_grid_components.dart';
import '../components/desktop_moniter_listview_component.dart';
import '../controller/desktop_moniter_home_controller.dart';

class DesktopMoniterHome extends StatelessWidget {
  const DesktopMoniterHome({super.key});

  @override
  Widget build(BuildContext context) {
    var desktopMoniterController = Get.find<DesktopMonitersController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Desktop Moniter",
        ),
        backgroundColor: appthem,
      ),
      body: Column(
        children: [
          Padding(
            padding: padA5,
            child: Row(
              children: [
                Text(
                  "Desktop Moniter",
                  style: hMediumX,
                ),
                const Spacer(),
                Obx(() => desktopMoniterController.isGridView.value
                    ? Align(
                        child: IconButton(
                            onPressed: () {
                              desktopMoniterController.changListType();
                            },
                            icon: const Icon(Icons.list)),
                      )
                    : IconButton(
                        onPressed: () {
                          desktopMoniterController.changListType();
                        },
                        icon: const Icon(Icons.dashboard))),
              ],
            ),
          ),
          vSpac12,
          Obx(() => desktopMoniterController.isGridView.value
              ? Flexible(
                  child: Container(
                      decoration: productBox,
                      height: 1000,
                      child: GridView.builder(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 2 / 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: 10,
                          itemBuilder: (BuildContext ctx, index) {
                            return const DesktopMoniterGridComponent();
                          })),
                )
              : SizedBox(
                  //decoration: productBox,
                  height: 500,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? 10 : 12,
                              right: index == 9 ? 10 : 0,
                              top: 5,
                              bottom: 5),
                          child: const DesktopMoniterListComponent(),
                        );
                      }),
                )),
        ],
      ),
    );
  }
}
