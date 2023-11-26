import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/cubit/page_cubit.dart';
import 'package:ngepet_id/shared/theme.dart';
import 'package:ngepet_id/ui/pages/chat_page.dart';
import 'package:ngepet_id/ui/pages/dashboard_page.dart';
import 'package:ngepet_id/ui/pages/profile_page.dart';
import 'package:ngepet_id/ui/pages/riwayat_page.dart';

import '../widgets/custom_bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const DashboardPage();
        case 1:
          return const ChatPage();
        case 2:
          return const RiwayatPage();
        case 3:
          return const ProfilePage();
        default:
          return const DashboardPage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: const [
              BoxShadow(
                color:
                    Color.fromRGBO(0, 0, 0, 10), // 25% hitam, // Warna shadow
                offset: Offset(0, 4), // Posisi shadow (X, Y)
                blurRadius: 20, // Radius blur
                spreadRadius: 0, // Jarak penyebaran shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                itemName: "dashboard",
              ),
              CustomBottomNavigationItem(
                index: 1,
                itemName: "chat",
              ),
              CustomBottomNavigationItem(
                index: 2,
                itemName: "riwayat",
              ),
              CustomBottomNavigationItem(
                index: 3,
                itemName: "profile",
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Stack(children: [
            buildContent(currentIndex),
            customBottomNavigation(),
          ]),
        );
      },
    );
  }
}
