import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_detail_profile.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/top_section_widget.dart';

// UserModel? user = FirebaseAuth.instance.currentUser;
// String? userId = user?.uid; // ID autentikasi pengguna

class AjukanBukaTokoPage extends StatelessWidget {
  const AjukanBukaTokoPage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Contoh objek Users, sesuaikan dengan struktur data Anda

    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Stack(
          children: [
            const TopSectionWidget(
              title: "Ajukan Buka Toko",
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
                      title: "Nama Toko*",
                      hintText: "Masukkan Nama Toko",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Deskripsi Toko*",
                      hintText: "Masukkan Deskripsi Toko",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Alamat Toko*",
                      hintText: "Masukkan Alamat Toko",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Nama Pemilik*",
                      hintText: "Masukkan Nama Pemilik",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Nomor Telepon*",
                      hintText: "Masukkan Nomor Telepon",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Alamat Email*",
                      hintText: "Masukkan Alamat Email",
                      controller:
                          TextEditingController(), // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomButton(
                      title: "Ajukan Toko",
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
