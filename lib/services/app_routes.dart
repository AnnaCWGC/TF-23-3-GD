import 'package:get/get.dart';
import 'package:hcp_test/modules/home/routes/home_routes_page.dart';
import 'package:hcp_test/modules/splash/routes/splash_routes_page.dart';

class AppRoutes {
  static final List<GetPage> ROUTES = <GetPage>[
    ...SplashRoutesPage.ROUTES,
    ...HomeRoutesPage.ROUTES
  ];
}
