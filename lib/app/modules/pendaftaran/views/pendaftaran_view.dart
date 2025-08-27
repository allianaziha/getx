import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/pendaftaran_controller.dart';

class PendaftaranView extends GetView<PendaftaranController> {
  const PendaftaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller sudah otomatis tersedia via GetView
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Obx(() => TextField(
                    onChanged: (value) {
                      controller.name.value = value;
                      controller.validateName(name: value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      errorText: controller.nameError.value.isNotEmpty
                          ? controller.nameError.value
                          : null,
                      prefixIcon: Icon(Icons.person),
                    ),
                  )),
              const SizedBox(height: 20),
              Obx(() => DropdownButtonFormField<String>(
                    value: controller.gender.value.isEmpty ? null : controller.gender.value,
                    hint: const Text('Pilih jenis kelamin'),
                    items: ['Laki-laki', 'Perempuan']
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.gender.value = value ?? '';
                      controller.validateGender(jenisKelamin: value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Jenis Kelamin',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      errorText: controller.genderError.value.isNotEmpty
                          ? controller.genderError.value
                          : null,
                      prefixIcon: Icon(Icons.wc),
                    ),
                  )),
              const SizedBox(height: 20),
              Obx(() => ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    tileColor: Colors.grey.shade100,
                    title: Text(
                      controller.dateOfBirth.value == null
                          ? 'Pilih Tanggal Lahir'
                          : DateFormat('dd-MM-yyyy').format(controller.dateOfBirth.value!),
                    ),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDate != null) {
                        controller.dateOfBirth.value = selectedDate;
                        controller.validateDateOfBirth(dateOfBirth: selectedDate);
                      }
                    },
                    subtitle: controller.dateOfBirthError.value.isNotEmpty
                        ? Text(
                            controller.dateOfBirthError.value,
                            style: const TextStyle(color: Colors.red),
                          )
                        : null,
                  )),
              const SizedBox(height: 20),
              Obx(() => TextField(
                    onChanged: (value) {
                      controller.phone.value = value;
                      controller.validatePhone(phone: value);
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Nomor Telepon',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      errorText: controller.phoneError.value.isNotEmpty
                          ? controller.phoneError.value
                          : null,
                      prefixIcon: Icon(Icons.phone),
                    ),
                  )),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    controller.submitForm();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}