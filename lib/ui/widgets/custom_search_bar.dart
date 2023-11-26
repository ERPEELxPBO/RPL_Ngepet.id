import 'package:flutter/material.dart';
import 'package:ngepet_id/shared/theme.dart';

class CustomSearchBar extends StatelessWidget {
  final bool enabled;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;

  const CustomSearchBar({
    Key? key,
    this.enabled = true,
    this.controller,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: 50,
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        onFieldSubmitted: onSubmitted,
        cursorColor: kBlackColor,
        decoration: InputDecoration(
          hintText: "Temukan makanan, dokter, dll",
          hintStyle: regularTextStyle.copyWith(
            fontSize: 14,
            color: kSilverColor,
          ),
          prefixIcon: Image.asset("assets/icons/icon_search.png"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: kSilverColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: kPrimaryColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
