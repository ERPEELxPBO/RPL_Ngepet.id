import 'package:flutter/material.dart';
import 'package:ngepet_id/ui/widgets/riwayat_item_card.dart';
import 'package:ngepet_id/ui/widgets/top_section_widget.dart';

import '../../shared/theme.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Stack(
          children: [
            const TopSectionWidget(
              title: "Riwayat",
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50,
              ),
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    RiwayatItemCard(
                      imageUrl: "assets/produk/produk_1.png",
                      title: "Whiskas Adult 1+ Years Tuna Flavor",
                    ),
                    RiwayatItemCard(
                      imageUrl: "assets/produk/produk_1.png",
                      title: "Whiskas Adult 1+ Years Tuna Flavor",
                    ),
                    RiwayatItemCard(
                      imageUrl: "assets/produk/produk_1.png",
                      title: "Whiskas Adult 1+ Years Tuna Flavor",
                    ),
                    RiwayatItemCard(
                      imageUrl: "assets/produk/produk_1.png",
                      title: "Whiskas Adult 1+ Years Tuna Flavor",
                    ),
                    RiwayatItemCard(
                      imageUrl: "assets/produk/produk_1.png",
                      title: "Whiskas Adult 1+ Years Tuna Flavor",
                    ),
                    SizedBox(
                      height: 50,
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
