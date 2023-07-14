import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcp_test/modules/home/routes/home_routes.dart';
import 'package:hcp_test/services/app_style.dart';

// Defines an array of bottom bar buttons with their respective attributes.
final List<Map<String, dynamic>> bottonsBar = [
  {
    "label": "Daily",
    "icon": Icons.home,
    "route_name": HomeRoutes.HOME_PAGE,
  },
  {
    "label": "5Min",
    "icon": Icons.hourglass_bottom_outlined,
    "route_name": HomeRoutes.INTRA_PAGE,
  },
];

class CBottomNavigationBar extends StatelessWidget {
  final int index;

  const CBottomNavigationBar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 10),
        height: 70,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottonsBar.length,
            (i) => InkWell(
              onTap: () => Get.offAllNamed(bottonsBar[i]["route_name"]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    bottonsBar[i]["icon"],
                    color: this.index == i
                        ? AppStyleColor.colorSecondary
                        : AppStyleColor.colorDisable,
                    size: 25.0,
                  ),
                  Text(
                    bottonsBar[i]["label"],
                    style: TextStyle(
                      color: this.index == i
                          ? AppStyleColor.colorSecondary
                          : AppStyleColor.colorDisable,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
