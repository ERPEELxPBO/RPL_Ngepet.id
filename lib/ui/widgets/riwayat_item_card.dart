import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class RiwayatItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const RiwayatItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1.0,
          color: kSilverColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/produk/produk_1.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Whiskas Adult 1+ Years Tuna Flavor",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: boldTextStyle.copyWith(
                fontSize: 16,
                color: kBlackColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
