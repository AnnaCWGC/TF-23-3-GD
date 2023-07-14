import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcp_test/modules/home/controller/home_controller.dart';
import 'package:hcp_test/services/app_style.dart';
import 'package:hcp_test/services/widgets/c_bottom_navigation_bar.dart';
import 'package:hcp_test/services/widgets/c_button.dart';
import 'package:hcp_test/services/widgets/c_containerInfo.dart';

import '../models/daily_model.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: AppStyleColor.colorPrimary),
        ),
        actions: [
           IconButton(
                onPressed: ()  =>
                     controller.fetchDailyActive(false, ""),
                icon: Icon(
                  Icons.refresh,
                ),
              ),
        ],
      ),
      body: Obx(
        () => Visibility(
          visible: controller.dailyActive.timeSeriesDaily.length > 0,
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
                        color: AppStyleColor.colorSecondary,
                      ),
                    ),
                    Obx(
                      () => DropdownButton(
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
                          controller.fetchDailyActive(true, value);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: FractionalOffset.centerRight,
                  child: CButton(
                    onTap: controller.changeVisibility,
                    type: controller.visibility == false ? CButtonType.PRIMARY: CButtonType.OUTLINE,
                    label: "Somente favoritados",
                    width: 150,
                    height: 24,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.dailyActive.timeSeriesDaily.length,
                      itemBuilder: (_, index) {
                        return Obx(
                          () => Visibility(
                            visible: controller.checkVisible(
                                controller.dailyActive.timeSeriesDaily[index],
                                0),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: CContainerInfo(
                                favorite: controller.checkFavorite(
                                    controller
                                        .dailyActive.timeSeriesDaily[index],
                                    0),
                                onTap: () => controller.addFavorite(
                                    controller
                                        .dailyActive.timeSeriesDaily[index],
                                    0),
                                date: controller
                                    .dailyActive.timeSeriesDaily[index].date,
                                open: controller.dailyActive
                                    .timeSeriesDaily[index]?.the1Open,
                                high: controller.dailyActive
                                    .timeSeriesDaily[index]?.the2High,
                                low: controller.dailyActive
                                    .timeSeriesDaily[index]?.the3Low,
                                close: controller.dailyActive
                                    .timeSeriesDaily[index]?.the4Close,
                                adjustedClose: controller.dailyActive
                                    .timeSeriesDaily[index]?.the5AdjustedClose,
                                volume: controller.dailyActive
                                    .timeSeriesDaily[index]?.the6Volume,
                                dividendAmount: controller
                                    .dailyActive
                                    .timeSeriesDaily[index]
                                    ?.the8SplitCoefficient,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CBottomNavigationBar(index: 0),
    );
  }
}
