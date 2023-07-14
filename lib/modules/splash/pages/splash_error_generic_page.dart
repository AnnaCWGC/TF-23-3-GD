import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcp_test/modules/splash/routes/splash_routes.dart';
import '../../../services/app_style.dart';
import '../../../services/widgets/c_button.dart';

class SplashErrorGenericPage extends StatelessWidget {
  const SplashErrorGenericPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Um erro inesperado ocorreu.\nTente novamente mais tarde.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppStyleFont.large,
                  color: AppStyleColor.colorPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: CButton(
                  onTap: () => Get.offAllNamed(SplashRoutes.SPLASH_PAGE),
                  height: 45,
                  label: 'Tentar novamente',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
