import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../counter/controllers/counter_controller.dart';
import '../../post/controllers/post_controller.dart';
import '../../pendaftaran/controllers/pendaftaran_controller.dart';
import '../../latihan/controllers/latihan_controller.dart';
import '../../profile/controllers/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CounterController>(() => CounterController());
    Get.lazyPut<PostController>(() => PostController());
    Get.lazyPut<PendaftaranController>(() => PendaftaranController());
    Get.lazyPut<LatihanController>(() => LatihanController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
