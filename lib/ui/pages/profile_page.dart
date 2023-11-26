import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/cubit/auth_cubit.dart';
import 'package:ngepet_id/cubit/page_cubit.dart';
import 'package:ngepet_id/ui/widgets/custom_button.dart';

import '../../shared/theme.dart';
import '../widgets/setting_item_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/user_6.png",
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            if (state is AuthSuccess) {
                              return Text(
                                state.user.name,
                                style: boldTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              );
                            } else {
                              return Text("");
                            }
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/profile-detail");
                          },
                          child: Text(
                            "Lihat Profil",
                            style: regularTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SettingItemCard(
                title: "Pengaturan Akun",
                onTap: () {},
              ),
              SettingItemCard(
                title: "Ajukan Buka Toko",
                onTap: () {
                  Navigator.pushNamed(context, '/ajukan-toko');
                },
              ),
              SettingItemCard(
                title: "Ajukan Role Dokter",
                onTap: () {
                  Navigator.pushNamed(context, '/ajukan-role-dokter');
                },
              ),
              SettingItemCard(
                title: "Terakhir Dilihat",
                onTap: () {},
              ),
              SettingItemCard(
                title: "Chat dan Support",
                onTap: () {},
              ),
              SettingItemCard(
                title: "FAQ",
                onTap: () {},
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: kRedColor,
                        content: Text(state.error),
                      ),
                    );
                  } else if (state is AuthInitial) {
                    context.read<PageCubit>().setPage(0);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/onboarding',
                      (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return CustomButton(
                    title: "Keluar",
                    color: kPrimaryColor,
                    onTap: () {
                      context.read<AuthCubit>().logOut();
                    },
                    titleColor: kWhiteColor,
                    icon: "assets/icons/icon_logout.png",
                  );
                },
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
