import 'package:flutter/material.dart';
import 'package:ngepet_id/shared/theme.dart';

class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomChatAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: ImageIcon(
            AssetImage('assets/icons/icon_arrow_back.png'),
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          title,
          style: boldTextStyle.copyWith(
            fontSize: 16,
            color: kBlackColor,
          ),
        ),
        actions: [
          // Ikon titik-titik di kanan
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Tambahkan aksi saat ikon titik-titik ditekan
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
