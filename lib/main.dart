import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hcp_test/services/app_core.dart';
import 'package:hcp_test/services/app_routes.dart';
import 'package:hcp_test/services/app_style.dart';
import 'package:hcp_test/services/application_bindings.dart';

void main() async {
  await GetStorage.init(AppCoreUrl.storageLocal);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      theme: AppStyle.theme,
      getPages: AppRoutes.ROUTES,
      builder: (_, widget) {
        final mediaQueryData = MediaQuery.of(_);
        return MediaQuery(
          data: mediaQueryData.copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
        // responsiveWrapper(_, widget);
      },
    ),
  );
}
