import 'package:get/get.dart';
import 'package:getx/app/data/models/latihan.dart';
import 'package:getx/app/services/latihan_service.dart';

class LatihanController extends GetxController {
  final LatihanService _latihanService = Get.put(LatihanService());

  RxList<Latihan> latihan = <Latihan>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await _latihanService.fetchData();
      if (response.statusCode == 200 && response.body != null) {
        var data = response.body!
            .map((json) => Latihan.fromJson(json))
            .toList();
        latihan.assignAll(data.cast<Latihan>());
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
