import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/cubit/buka_toko_cubit.dart';

import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_detail_profile.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/top_section_widget.dart';

// UserModel? user = FirebaseAuth.instance.currentUser;
// String? userId = user?.uid; // ID autentikasi pengguna

class AjukanBukaTokoPage extends StatelessWidget {
  AjukanBukaTokoPage({Key? key});

  final TextEditingController namaTokoController = TextEditingController(text: '');
  final TextEditingController deskripsiTokoController = TextEditingController(text: '');
  final TextEditingController alamatTokoController = TextEditingController(text: '');
  final TextEditingController namaPemilikTokoController = TextEditingController(text: '');
  final TextEditingController noTeleponTokoController = TextEditingController(text: '');
  final TextEditingController emailTokoController = TextEditingController(text: '');

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
                          namaTokoController, // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Deskripsi Toko*",
                      hintText: "Masukkan Deskripsi Toko",
                      controller:
                          deskripsiTokoController, // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Alamat Toko*",
                      hintText: "Masukkan Alamat Toko",
                      controller:
                          alamatTokoController, // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Nama Pemilik*",
                      hintText: "Masukkan Nama Pemilik",
                      controller:
                          namaPemilikTokoController, // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Nomor Telepon*",
                      hintText: "Masukkan Nomor Telepon",
                      controller:
                          noTeleponTokoController, // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomTextFormField(
                      title: "Alamat Email*",
                      hintText: "Masukkan Alamat Email",
                      controller:
                          emailTokoController, // Sesuaikan dengan controller yang diperlukan
                      validator: (value) {},
                    ),
                    CustomButton(
                      title: "Ajukan Toko",
                      color: kPrimaryColor,
                      titleColor: kWhiteColor,
                      onTap: () {
                        context.read<BukaTokoCubit>().ajukanBukaToko(
                          userId: 
        'userId': FirebaseAuth.instance.currentUser?.uid, namaToko: namaToko, deskripsiToko: deskripsiToko, alamatToko: alamatToko, namaPemilik: namaPemilik, noTelepon: noTelepon, email: email)
                      },
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
