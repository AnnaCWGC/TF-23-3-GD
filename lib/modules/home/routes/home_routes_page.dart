import 'package:get/get.dart';
import 'package:hcp_test/modules/home/binding/home_binding.dart';
import 'package:hcp_test/modules/home/pages/home_page.dart';
import 'package:hcp_test/modules/home/pages/intra_page.dart';
import 'package:hcp_test/modules/home/routes/home_routes.dart';

class HomeRoutesPage {
  static final List<GetPage> ROUTES = <GetPage>[
    GetPage(
      name: HomeRoutes.HOME_PAGE,
      page: () => HomePage(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: HomeRoutes.INTRA_PAGE,
      page: () => IntraPage(),
      bindings: [HomeBinding()],
    ),
  ];
}
