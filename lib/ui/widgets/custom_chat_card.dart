import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomChatCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  // final String lastChat;
  // final String lastTime;
  final bool read;
  final Function() onTap;

  const CustomChatCard({
    super.key,
    required this.imageUrl,
    required this.name,
    // required this.lastChat,
    // required this.lastTime,
    this.read = false,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.only(top: 15),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.0,
            color: kSilverColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 0.5,
                      color: kSilverColor,
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        imageUrl,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 29),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      name,
                      style: boldTextStyle.copyWith(
                        fontSize: 16,
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          read
                              ? "assets/icons/icon_check_green.png"
                              : "assets/icons/icon_check_silver.png",
                          width: 15,
                          height: 5.36,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 5),
                        // Text(
                        //   lastChat,
                        //   style: regularTextStyle.copyWith(
                        //     fontSize: 12,
                        //     color: kBlackColor,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 10),
            //   child: Text(
            //     lastTime,
            //     style: regularTextStyle.copyWith(
            //       fontSize: 12,
            //       color: kBlackColor,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
