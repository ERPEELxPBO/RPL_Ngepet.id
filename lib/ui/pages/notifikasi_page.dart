import 'package:flutter/material.dart';
import 'package:ngepet_id/shared/theme.dart';

import '../widgets/notifikasi_item_card.dart';
import '../widgets/top_section_widget.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Stack(
          children: [
            const TopSectionWidget(
              title: "Notfikasi",
              back: true,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 50,
              ),
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    NotifikasiItemCard(
                      title: "Lorem ipsum dolor sit amet",
                      content:
                          "Lorem ipsum dolor sit amet consectetur. Elit scelerisque suspendisse orci vitae vitae pharetra a lectus. Lectus sed nullam enim nascetur.",
                      read: false,
                    ),
                    NotifikasiItemCard(
                      title: "Lorem ipsum dolor sit amet",
                      content:
                          "Lorem ipsum dolor sit amet consectetur. Elit scelerisque suspendisse orci vitae vitae pharetra a lectus. Lectus sed nullam enim nascetur.",
                      read: true,
                    ),
                    NotifikasiItemCard(
                      title: "Lorem ipsum dolor sit amet",
                      content:
                          "Lorem ipsum dolor sit amet consectetur. Elit scelerisque suspendisse orci vitae vitae pharetra a lectus. Lectus sed nullam enim nascetur.",
                      read: true,
                    ),
                    NotifikasiItemCard(
                      title: "Lorem ipsum dolor sit amet",
                      content:
                          "Lorem ipsum dolor sit amet consectetur. Elit scelerisque suspendisse orci vitae vitae pharetra a lectus. Lectus sed nullam enim nascetur.",
                      read: true,
                    ),
                    NotifikasiItemCard(
                      title: "Lorem ipsum dolor sit amet",
                      content:
                          "Lorem ipsum dolor sit amet consectetur. Elit scelerisque suspendisse orci vitae vitae pharetra a lectus. Lectus sed nullam enim nascetur.",
                      read: true,
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
