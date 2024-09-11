import 'package:get/get.dart';
import 'package:interview_pt_4net/pages/home-page/home_page_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}