import 'package:get/get.dart';
import 'package:hcp_test/modules/splash/binding/splash_binding.dart';
import 'package:hcp_test/modules/splash/pages/splash_error_generic_page.dart';
import 'package:hcp_test/modules/splash/pages/splash_page.dart';

import 'splash_routes.dart';

class SplashRoutesPage {
  static final List<GetPage> ROUTES = <GetPage>[
    GetPage(
      name: SplashRoutes.SPLASH_PAGE,
      page: () => SplashPage(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: SplashRoutes.SPLASH_ERROR_GENERIC_PAGE,
      page: () => SplashErrorGenericPage(),
      bindings: [SplashBinding()],
    ),
  ];
}
