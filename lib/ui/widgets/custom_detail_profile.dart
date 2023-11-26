import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextDisplayField extends StatelessWidget {
  final String title;
  final String? value;
  final bool obscureText;

  const CustomTextDisplayField({
    Key? key,
    required this.title,
    this.value,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: semiBoldTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            enabled: false, // Tidak memungkinkan input
            cursorColor: kBlackColor,
            obscureText: obscureText,
            initialValue: value,
            decoration: InputDecoration(
              hintText: value,
              hintStyle: regularTextStyle.copyWith(
                fontSize: 14,
                color: kSilverColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: kSilverColor,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                  width: 2,
                ),
              ),
              suffixIcon: obscureText
                  ? IconButton(
                      icon: Icon(
                        Icons.visibility_off,
                        color: kSilverColor,
                      ),
                      onPressed: () {
                        // Tidak ada perubahan pada tampilan karena hanya menampilkan data
                      },
                    )
                  : null,
            ),
          )
        ],
      ),
    );
  }
}
