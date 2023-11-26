import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/cubit/auth_cubit.dart';
import 'package:ngepet_id/models/user_model.dart';

import '../../shared/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_detail_profile.dart';
import '../widgets/top_section_widget.dart';

// UserModel? user = FirebaseAuth.instance.currentUser;
// String? userId = user?.uid; // ID autentikasi pengguna

class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Contoh objek Users, sesuaikan dengan struktur data Anda
    UserModel userProfile = UserModel(
      id: "1",
      email: "fahmi@example.com",
      name: "Fahmi Agung M",
      username: "fahmiagungm",
      no_telepon: "081234567890",
      role_id: "User Biasa",
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Stack(
          children: [
            const TopSectionWidget(
              title: "Detail Profile",
              back: true,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 50,
              ),
              child: SingleChildScrollView(
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return Column(
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
                                    Text(
                                      state.user
                                          .name, // Mengambil nama dari objek Users
                                      style: boldTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Menambahkan CustomTextDisplayField untuk menampilkan informasi profil

                          CustomTextDisplayField(
                            title: "Username",
                            value: state.user.username,
                          ),
                          CustomTextDisplayField(
                            title: "Email",
                            value: state.user.email,
                          ),
                          CustomTextDisplayField(
                            title: "No Handphone",
                            value: state.user.no_telepon,
                          ),
                          CustomTextDisplayField(
                            title: "Role",
                            value: state.user.role_id == "usr_usr"
                                ? "User Biasa"
                                : "Nanti diganti",
                          ),
                          CustomTextDisplayField(
                            title: "Password",
                            value: "Haloww",
                            obscureText: true,
                          ),

                          CustomButton(
                            title: "Edit Profile",
                            color: kPrimaryColor,
                            onTap: () {},
                            titleColor: kWhiteColor,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      );
                    } else {
                      return Column(
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
                                    Text(
                                      "", // Mengambil nama dari objek Users
                                      style: boldTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Menambahkan CustomTextDisplayField untuk menampilkan informasi profil

                          CustomTextDisplayField(
                            title: "Username",
                            value: "",
                          ),
                          CustomTextDisplayField(
                            title: "Email",
                            value: "",
                          ),
                          CustomTextDisplayField(
                            title: "No Handphone",
                            value: "",
                          ),
                          CustomTextDisplayField(
                            title: "Role",
                            value: "",
                          ),
                          CustomTextDisplayField(
                            title: "Password",
                            value: "",
                            obscureText: true,
                          ),

                          CustomButton(
                            title: "Edit Profile",
                            color: kPrimaryColor,
                            onTap: () {},
                            titleColor: kWhiteColor,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
