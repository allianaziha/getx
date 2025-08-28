import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/latihan_controller.dart';
import 'latihan_detail_view.dart';

class LatihanView extends GetView<LatihanController> {
  LatihanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.fetchData,
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          );
        }

        final latihan = controller.latihan;
        if (latihan.isEmpty) {
          return const Center(child: Text('Data kosong'));
        }

        return ListView.separated(
          itemCount: latihan.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (ctx, i) {
            final item = latihan[i];
            return ListTile(
              leading: CircleAvatar(
                child: Text(item.nomor?.toString() ?? '-'),
              ),
              title: Text(item.nama ?? ''),
              subtitle: Text(item.arti ?? ''),
              trailing: Text(item.type ?? ''),
              onTap: () => Get.to(() => LatihanDetailView(item: item)),
            );
          },
        );
      }),
    );
  }
}
