import 'package:flutter/material.dart';
import 'package:ngepet_id/shared/theme.dart';

class VerifikasiTokoPage extends StatelessWidget {
  const VerifikasiTokoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Text(
          "Ajukan Buka Toko sedang dalam tahap verifikasi",
          style: boldTextStyle.copyWith(
            fontSize: 24,
            color: kBlackColor,
          ),
        ),
      ),
    );
  }
}
