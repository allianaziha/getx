import 'package:flutter/material.dart';
import 'package:getx/app/data/models/latihan.dart';

class LatihanDetailView extends StatelessWidget {
  final Latihan item;

  const LatihanDetailView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.nama ?? ''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Asma: ${item.asma}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Arti: ${item.arti}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Jumlah Ayat: ${item.ayat}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Jenis: ${item.type}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Keterangan: ${item.keterangan}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
