import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class LocationWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double jarak;
  final Color color;

  const LocationWidget({
    super.key,
    required this.title,
    required this.jarak,
    this.color = const Color(0xffF3AAFF),
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 160,
      height: 283,
      child: Column(
        children: [
          Container(
            width: 160,
            height: 225,
            padding: const EdgeInsets.only(
              top: 20,
              right: 15,
              left: 15,
            ),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kWhiteColor,
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/icons/icon_location.png",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "$jarak Km",
                      style: regularTextStyle.copyWith(
                        fontSize: 14,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 23),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                        imageUrl,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: semiBoldTextStyle.copyWith(
                fontSize: 14,
                color: kBlack2Color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
