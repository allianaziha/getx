import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/pendaftaran/views/results_screen_view.dart';

class PendaftaranController extends GetxController {
  // Reactive fields for form
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateOfBirth = Rxn<DateTime>();
  RxString phone = ''.obs;

  // Error fields for validation
  RxString nameError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateOfBirthError = ''.obs;
  RxString phoneError = ''.obs;

  // Name validation
  void validateName({required String name}) {
    if (name.isEmpty) {
      nameError.value = 'Nama lengkap tidak boleh kosong';
    } else if (name.length < 3) {
      nameError.value = 'Nama lengkap minimal 3 karakter';
    } else {
      nameError.value = '';
    }
  }

  // Gender validation
  void validateGender({required String? jenisKelamin}) {
    if (jenisKelamin == null || jenisKelamin.isEmpty) {
      genderError.value = 'Jenis kelamin harus dipilih';
    } else {
      genderError.value = '';
    }
  }

  // Date of birth validation
  void validateDateOfBirth({required DateTime? dateOfBirth}) {
    if (dateOfBirth == null) {
      dateOfBirthError.value = 'Pilih tanggal lahir';
    } else {
      final now = DateTime.now();
      final age = now.year - dateOfBirth.year;
      if (age < 2) {
        dateOfBirthError.value = 'Umur minimal 2 tahun';
      } else {
        dateOfBirthError.value = '';
      }
    }
  }

  // Phone number validation
  void validatePhone({required String phone}) {
    if (!GetUtils.isPhoneNumber(phone)) {
      phoneError.value = 'Nomor telepon tidak valid';
    } else {
      phoneError.value = '';
    }
  }

  void submitForm() {
    validateName(name: name.value);
    validateGender(jenisKelamin: gender.value);
    validateDateOfBirth(dateOfBirth: dateOfBirth.value);
    validatePhone(phone: phone.value);

    if (nameError.value.isEmpty &&
        genderError.value.isEmpty &&
        dateOfBirthError.value.isEmpty &&
        phoneError.value.isEmpty) {
      Get.to(() => ResultsScreenView(
          name: name.value,
          gender: gender.value,
          dateOfBirth: dateOfBirth.value!,
          phone: phone.value,
        ),
      );
      Get.snackbar(
        'Sukses',
        'Pendaftaran berhasil disubmit',
        backgroundColor: Colors.green.shade600,
        colorText: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        borderRadius: 16,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
        snackStyle: SnackStyle.FLOATING,
        boxShadows: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      );
    } else {
      Get.snackbar(
        'Gagal',
        'Periksa kembali data yang diinput',
        backgroundColor: Colors.red.shade700,
        colorText: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        borderRadius: 16,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
        snackStyle: SnackStyle.FLOATING,
        boxShadows: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}