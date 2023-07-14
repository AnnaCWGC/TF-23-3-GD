import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcp_test/modules/home/controller/home_controller.dart';
import 'package:hcp_test/services/app_style.dart';
import 'package:hcp_test/services/widgets/c_bottom_navigation_bar.dart';
import 'package:hcp_test/services/widgets/c_button.dart';
import 'package:hcp_test/services/widgets/c_containerInfo.dart';

class IntraPage extends GetView<HomeController> {
  const IntraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Intra",
          style: TextStyle(color: AppStyleColor.colorPrimary),
        ),
        actions: [
          IconButton(
            onPressed: () => controller.fetchIntraActive(false, ""),
            icon: Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: Obx(
        () => Visibility(
          visible: controller.intraActive.timeSeries5Min.length > 0,
          replacement: Center(
              child: Container(
            height: 140,
            child: Center(
              child: CircularProgressIndicator(
                color: AppStyleColor.colorSecondary,
              ),
            ),
          )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Ordenar por: ",
                      style: TextStyle(
                        color: AppStyleColor.colorPrimary,
                      ),
                    ),
                    Obx(() => DropdownButton(
                          value: controller.selectedSort == ""
                              ? 'Default'
                              : controller.selectedSort,
                          icon: Icon(
                            Icons.sort,
                            color: AppStyleColor.colorPrimary,
                          ),
                          style: TextStyle(
                            color: AppStyleColor.colorPrimary,
                          ),
                          underline: Container(
                            height: 2,
                            color: AppStyleColor.colorPrimary,
                          ),
                          borderRadius: BorderRadius.circular(6),
                          dropdownColor: AppStyleColor.colorBackground,
                          focusColor: AppStyleColor.colorBackground,
                          items: controller.sortList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            controller.fetchIntraActive(true, value);
                          },
                        )),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: FractionalOffset.centerRight,
                  child: CButton(
                    onTap: controller.changeVisibility,
                    type: CButtonType.OUTLINE,
                    label: "Somente favoritados",
                    width: 150,
                    height: 24,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Obx(() => ListView.builder(
                        itemCount: controller.intraActive.timeSeries5Min.length,
                        itemBuilder: (_, index) {
                          return Obx(
                            () => Visibility(
                              visible: controller.checkVisible(
                                  controller.intraActive.timeSeries5Min[index],
                                  1),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: CContainerInfo(
                                  favorite: controller.checkFavorite(
                                      controller
                                          .intraActive.timeSeries5Min[index],
                                      1),
                                  onTap: () => controller.addFavorite(
                                      controller
                                          .intraActive.timeSeries5Min[index],
                                      1),
                                  date: controller.intraActive
                                      .timeSeries5Min[index].dateTimeString,
                                  open: controller.intraActive
                                      .timeSeries5Min[index]?.the1Open,
                                  high: controller.intraActive
                                      .timeSeries5Min[index]?.the2High,
                                  low: controller.intraActive
                                      .timeSeries5Min[index]?.the3Low,
                                  close: controller.intraActive
                                      .timeSeries5Min[index]?.the4Close,
                                  volume: controller.intraActive
                                      .timeSeries5Min[index]?.the5Volume,
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CBottomNavigationBar(index: 1),
    );
  }
}
