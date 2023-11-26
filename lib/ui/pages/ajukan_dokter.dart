import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/top_section_widget.dart';

// UserModel? user = FirebaseAuth.instance.currentUser;
// String? userId = user?.uid; // ID autentikasi pengguna

class AjukanDokterPage extends StatelessWidget {
  const AjukanDokterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Contoh objek Users, sesuaikan dengan struktur data Anda

    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Stack(
          children: [
            const TopSectionWidget(
              title: "Ajukan Role Dokter",
              back: true,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 70,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      title: "Nama Dokter*",
                      hintText: "Masukkan Nama Dokter",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Riwayat Pendidikan*",
                      hintText: "Masukkan Riwayat Pendidikan",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Pengalaman Praktik*",
                      hintText: "Masukkan Pengalaman Praktik",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Bidang Keahlian*",
                      hintText: "Masukkan Bidang Keahlian",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Kemampuan Teknis*",
                      hintText: "Masukkan Kemampuan Teknis",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Sertifikasi*",
                      hintText: "Masukkan Sertifikasi",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomButton(
                      title: "Ajukan Role",
                      color: kPrimaryColor,
                      onTap: () {},
                      titleColor: kWhiteColor,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
