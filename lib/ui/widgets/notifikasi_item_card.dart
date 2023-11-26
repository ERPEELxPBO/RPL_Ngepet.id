import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class NotifikasiItemCard extends StatelessWidget {
  final bool read;
  final String title;
  final String content;

  const NotifikasiItemCard({
    super.key,
    this.read = false,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 18,
      ),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: !read ? kPrimaryColor : kWhiteColor,
        borderRadius: BorderRadius.circular(
          15,
        ),
        border: Border.all(
          color: kSilver2Color,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: mediumTextStyle.copyWith(
              fontSize: 16,
              color: !read ? kWhiteColor : kBlackColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            content,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: regularTextStyle.copyWith(
              fontSize: 14,
              color: !read ? kWhiteColor : kSilverColor,
            ),
          ),
        ],
      ),
    );
  }
}
