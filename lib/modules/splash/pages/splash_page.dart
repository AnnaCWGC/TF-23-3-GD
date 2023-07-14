import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcp_test/modules/splash/controller/splash_controller.dart';
import 'package:hcp_test/services/app_style.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Obx(
            () => AnimatedOpacity(
              opacity: controller.opacity,
              duration: Duration(milliseconds: 200),
              child: Text(
                'Bem-vindo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppStyleFont.large,
                  color: AppStyleColor.colorPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
