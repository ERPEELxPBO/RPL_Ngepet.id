import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/cubit/buka_toko_cubit.dart';
import 'package:ngepet_id/ui/pages/verifikasi_toko_page.dart';

import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/top_section_widget.dart';

// UserModel? user = FirebaseAuth.instance.currentUser;
// String? userId = user?.uid; // ID autentikasi pengguna

class AjukanBukaTokoPage extends StatelessWidget {
  AjukanBukaTokoPage({super.key});

  final TextEditingController namaTokoController =
      TextEditingController(text: '');
  final TextEditingController deskripsiTokoController =
      TextEditingController(text: '');
  final TextEditingController alamatTokoController =
      TextEditingController(text: '');
  final TextEditingController namaPemilikTokoController =
      TextEditingController(text: '');
  final TextEditingController noTeleponTokoController =
      TextEditingController(text: '');
  final TextEditingController emailTokoController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    // Contoh objek Users, sesuaikan dengan struktur data Anda

    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: BlocListener<BukaTokoCubit, BukaTokoState>(
          listener: (context, state) {
            if (state is BukaTokoLoading) {
              // Menunjukkan CircularProgressIndicator atau tindakan lainnya
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            } else if (state is BukaTokoSuccess) {
              // Tutup dialog (Jika ada)
              Navigator.of(context).pop();

              // Navigasi ke halaman sebelumnya
              Navigator.pop(context);

              // Setelah kembali ke halaman sebelumnya,
              // Navigasi ke halaman verifikasi atau menampilkan pesan verifikasi
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VerifikasiTokoPage(),
                ),
              );
            } else if (state is BukaTokoFailed) {
              // Tutup dialog (Jika ada)
              Navigator.of(context).pop();

              // Tampilkan pesan kesalahan
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Gagal"),
                    content: Text("Pengajuan gagal: ${state.error}"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Stack(
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
                        validator: (value) {
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        title: "Deskripsi Toko*",
                        hintText: "Masukkan Deskripsi Toko",
                        controller:
                            deskripsiTokoController, // Sesuaikan dengan controller yang diperlukan
                        validator: (value) {
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        title: "Alamat Toko*",
                        hintText: "Masukkan Alamat Toko",
                        controller:
                            alamatTokoController, // Sesuaikan dengan controller yang diperlukan
                        validator: (value) {
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        title: "Nama Pemilik*",
                        hintText: "Masukkan Nama Pemilik",
                        controller:
                            namaPemilikTokoController, // Sesuaikan dengan controller yang diperlukan
                        validator: (value) {
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        title: "Nomor Telepon*",
                        hintText: "Masukkan Nomor Telepon",
                        controller:
                            noTeleponTokoController, // Sesuaikan dengan controller yang diperlukan
                        validator: (value) {
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        title: "Alamat Email*",
                        hintText: "Masukkan Alamat Email",
                        controller:
                            emailTokoController, // Sesuaikan dengan controller yang diperlukan
                        validator: (value) {
                          return null;
                        },
                      ),
                      CustomButton(
                        title: "Ajukan Toko",
                        color: kPrimaryColor,
                        titleColor: kWhiteColor,
                        onTap: () {
                          final user = FirebaseAuth.instance.currentUser;
                          if (user != null) {
                            context.read<BukaTokoCubit>().ajukanBukaToko(
                                  userId: user.uid,
                                  namaToko: namaTokoController.text,
                                  deskripsiToko: deskripsiTokoController.text,
                                  alamatToko: alamatTokoController.text,
                                  namaPemilik: namaPemilikTokoController.text,
                                  noTelepon: noTeleponTokoController.text,
                                  email: emailTokoController.text,
                                );
                          } else {
                            // Handle jika user tidak masuk (misalnya, tampilkan pesan kesalahan)
                          }
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
      ),
    );
  }
}
