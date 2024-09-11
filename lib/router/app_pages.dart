import 'package:get/get.dart';
import 'package:interview_pt_4net/pages/home-page/home_page_binding.dart';
import 'package:interview_pt_4net/pages/home-page/home_page_view.dart';

part 'app_routes.dart';

class AppPages {
  
  AppPages._();

  static const INITIAL = Routes.HOME_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
  ];
}